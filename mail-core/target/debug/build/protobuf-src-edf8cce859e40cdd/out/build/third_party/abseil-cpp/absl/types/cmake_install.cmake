# Install script for directory: C:/Users/adnan/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/protobuf-src-2.1.1+27.1/protobuf/third_party/abseil-cpp/absl/types

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/lib/pkgconfig/absl_any.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/lib/pkgconfig/absl_bad_any_cast.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/lib/pkgconfig/absl_bad_any_cast_impl.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/types/Debug/absl_bad_any_cast_impl.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/types/Release/absl_bad_any_cast_impl.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/types/MinSizeRel/absl_bad_any_cast_impl.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/types/RelWithDebInfo/absl_bad_any_cast_impl.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/lib/pkgconfig/absl_span.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/lib/pkgconfig/absl_optional.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/lib/pkgconfig/absl_bad_optional_access.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/types/Debug/absl_bad_optional_access.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/types/Release/absl_bad_optional_access.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/types/MinSizeRel/absl_bad_optional_access.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/types/RelWithDebInfo/absl_bad_optional_access.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/lib/pkgconfig/absl_bad_variant_access.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/types/Debug/absl_bad_variant_access.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/types/Release/absl_bad_variant_access.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/types/MinSizeRel/absl_bad_variant_access.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/types/RelWithDebInfo/absl_bad_variant_access.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/lib/pkgconfig/absl_variant.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/lib/pkgconfig/absl_compare.pc")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "C:/Users/adnan/Desktop/Projects/GritstoneMailService/mail-core/target/debug/build/protobuf-src-edf8cce859e40cdd/out/build/third_party/abseil-cpp/absl/types/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
