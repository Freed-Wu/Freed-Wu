foreach(sanitizer Asan Ubsan)
  if(NOT ${sanitizer} IN_LIST CMAKE_CONFIGURATION_TYPES)
    list(APPEND CMAKE_CONFIGURATION_TYPES ${sanitizer})
  endif()
endforeach()

set(CMAKE_C_FLAGS_ASAN
    "${CMAKE_C_FLAGS_DEBUG} -fsanitize=address" CACHE STRING
    "Flags used by the C compiler for Asan build type." FORCE)
set(CMAKE_CXX_FLAGS_ASAN
    "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=address" CACHE STRING
    "Flags used by the C++ compiler for Asan build type." FORCE)
set(CMAKE_EXE_LINKER_FLAGS_ASAN
    "${CMAKE_EXE_LINKER_FLAGS_DEBUG} -fsanitize=address" CACHE STRING
    "Linker flags to create executables for Asan build type." FORCE)
set(CMAKE_SHARED_LINKER_FLAGS_ASAN
    "${CMAKE_SHARED_LINKER_FLAGS_DEBUG} -fsanitize=address" CACHE STRING
    "Linker flags to create shared libraries for Asan build type." FORCE)

set(CMAKE_C_FLAGS_UBSAN
    "${CMAKE_C_FLAGS_DEBUG} -fsanitize=undefined" CACHE STRING
    "Flags used by the C compiler for Ubsan build type." FORCE)
set(CMAKE_CXX_FLAGS_UBSAN
    "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=undefined" CACHE STRING
    "Flags used by the C++ compiler for Ubsan build type." FORCE)
set(CMAKE_EXE_LINKER_FLAGS_UBSAN
    "${CMAKE_EXE_LINKER_FLAGS_DEBUG} -fsanitize=undefined" CACHE STRING
    "Linker flags to create executables for Ubsan build type." FORCE)
set(CMAKE_SHARED_LINKER_FLAGS_UBSAN
    "${CMAKE_SHARED_LINKER_FLAGS_DEBUG} -fsanitize=undefined" CACHE STRING
    "Linker flags to create shared libraries for Ubsan build type." FORCE)
