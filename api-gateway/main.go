package main

import (
	"log"
	"net/http"
	"os"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v5"
	"github.com/jmoiron/sqlx"
	"github.com/joho/godotenv"
	_ "github.com/lib/pq"
)

type Email struct {
	ID         string    `db:"id" json:"id"`
	Sender     string    `db:"sender" json:"sender"`
	Recipient  string    `db:"recipient" json:"recipient"`
	Subject    *string   `db:"subject" json:"subject"`
	BodyPlain  *string   `db:"body_plain" json:"body_plain"`
	ReceivedAt time.Time `db:"received_at" json:"received_at"`
	AccountID  *string   `db:"account_id" json:"account_id,omitempty"`
}

type AccountRequest struct {
	EmailAddress string `json:"email_address"`
	Password     string `json:"password"`
}

type LoginRequest struct {
	EmailAddress string `json:"email_address"`
	Password     string `json:"password"`
}

type SendRequest struct {
	To      string `json:"to"`
	Subject string `json:"subject"`
	Body    string `json:"body"`
}

var db *sqlx.DB
var jwtKey = []byte("gritstone_secret_key_change_me")

func main() {
	_ = godotenv.Load("../.env")

	dbURL := os.Getenv("DATABASE_URL")
	if dbURL == "" {
		dbURL = "postgres://mailuser:mailpassword@127.0.0.1:5432/gritstonemail?sslmode=disable"
	}

	var err error
	db, err = sqlx.Connect("postgres", dbURL)
	if err != nil {
		log.Fatalln("Failed to connect to database:", err)
	}

	r := gin.Default()

	// Serve Static Files
	r.StaticFile("/", "./frontend/index.html")

	// API Routes
	r.GET("/health", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{"status": "up"})
	})

	r.POST("/login", login)
	r.POST("/accounts", createAccount)

	// Protected routes
	authorized := r.Group("/")
	authorized.Use(authMiddleware())
	{
		authorized.GET("/emails", getEmails)
		authorized.POST("/send", sendMail)
	}

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	log.Printf("Management API starting on :%s", port)
	r.Run(":" + port)
}

func authMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		tokenString := c.GetHeader("Authorization")
		if tokenString == "" {
			c.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
			c.Abort()
			return
		}

		token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
			return jwtKey, nil
		})

		if err != nil || !token.Valid {
			c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid token"})
			c.Abort()
			return
		}

		claims := token.Claims.(jwt.MapClaims)
		c.Set("email", claims["email"])
		c.Next()
	}
}

func login(c *gin.Context) {
	var req LoginRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	var storedPassword string
	err := db.Get(&storedPassword, "SELECT password_hash FROM accounts WHERE email_address = $1", req.EmailAddress)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid credentials"})
		return
	}

	if storedPassword != req.Password {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid credentials"})
		return
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"email": req.EmailAddress,
		"exp":   time.Now().Add(time.Hour * 24).Unix(),
	})

	tokenString, err := token.SignedString(jwtKey)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to generate token"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"token": tokenString, "email": req.EmailAddress})
}

func createAccount(c *gin.Context) {
	var req AccountRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	_, err := db.Exec("INSERT INTO accounts (email_address, password_hash) VALUES ($1, $2)", 
		req.EmailAddress, req.Password)
	
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Account creation failed: " + err.Error()})
		return
	}

	c.JSON(http.StatusCreated, gin.H{"message": "Account created"})
}

func getEmails(c *gin.Context) {
	email, _ := c.Get("email")
	emails := []Email{}
	// Select specific columns to avoid errors if the table schema changes (like adding account_id)
	err := db.Select(&emails, "SELECT id, sender, recipient, subject, body_plain, received_at FROM emails WHERE recipient = $1 ORDER BY received_at DESC", email)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, emails)
}

func sendMail(c *gin.Context) {
	sender, _ := c.Get("email")
	var req SendRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	_, err := db.Exec("INSERT INTO emails (sender, recipient, subject, body_plain) VALUES ($1, $2, $3, $4)",
		sender, req.To, req.Subject, req.Body)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Email sent"})
}
