cmake_minimum_required(VERSION 3.10)
if(DEFINED ENV{GITHUB_REF_NAME})
  set(VERSION $ENV{GITHUB_REF_NAME})
else()
  set(VERSION 0.0.0.0)
endif()
project(
  {{ expand ('%:p:h:t') }}
  VERSION ${VERSION}
  DESCRIPTION {{ expand ('%:p:h:t') }}
  HOMEPAGE_URL {{ g:snips_github }}/{{ expand ('%:p:h:t') }})
set(CMAKE_INCLUDE_CURRENT_DIR ON)
add_executable(main main.c)
install(TARGETS main RUNTIME)
find_program(help2man NAMES help2man)
if(help2man)
  add_custom_target(main.1 ALL COMMAND help2man ${CMAKE_BINARY_DIR}/main >
                                       main.1)
  include(GNUInstallDirs)
  install(FILES ${CMAKE_BINARY_DIR}/main.1
          DESTINATION ${CMAKE_INSTALL_MANDIR}/man1)
endif()

configure_file(config.h.in config.h)

include(CTest)
add_subdirectory(tests EXCLUDE_FORM_ALL)

set(CPACK_PACKAGE_CONTACT {{ g:snips_github }}/{{ expand ('%:p:h:t') }}/issues)
include(CPack)
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE")
set(CPACK_RESOURCE_FILE_README "${CMAKE_CURRENT_SOURCE_DIR}/README.md")
set(CPACK_ARCHIVE_THREADS 0)
set(CPACK_THREADS 0)