# Install script for directory: C:/Users/adnan/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/protobuf-src-2.1.1+27.1/protobuf/third_party/abseil-cpp/absl/time

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/lib/pkgconfig/absl_time.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/time/Debug/absl_time.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/time/Release/absl_time.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/time/MinSizeRel/absl_time.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/time/RelWithDebInfo/absl_time.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/lib/pkgconfig/absl_civil_time.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/time/Debug/absl_civil_time.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/time/Release/absl_civil_time.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/time/MinSizeRel/absl_civil_time.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/time/RelWithDebInfo/absl_civil_time.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/lib/pkgconfig/absl_time_zone.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/time/Debug/absl_time_zone.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/time/Release/absl_time_zone.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/time/MinSizeRel/absl_time_zone.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/time/RelWithDebInfo/absl_time_zone.lib")
  endif()
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/time/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
