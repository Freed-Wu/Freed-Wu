cmake_minimum_required(VERSION 3.10)
string(REGEX MATCH [[[0-9](\.[0-9])*]] VERSION "$ENV{GITHUB_REF_NAME}")
if(NOT VERSION)
  set(VERSION 0.0.0.0)
endif()
set(HOMEPAGE_URL {{ g:snips_github }}/{{ expand ('%:p:h:t') }})
project(
  {{ expand ('%:p:h:t') }}
  VERSION ${VERSION}
  DESCRIPTION {{ expand ('%:p:h:t') }}
  HOMEPAGE_URL ${HOMEPAGE_URL})
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
configure_file(${PROJECT_NAME}.pc.in ${PROJECT_NAME}.pc @ONLY)

include(CTest)
add_subdirectory(tests EXCLUDE_FORM_ALL)

set(CPACK_PACKAGE_CONTACT ${HOMEPAGE_URL}/issues)
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "{{ g:snips_author }} <{{ g:snips_email }}>")
set(CPACK_RPM_PACKAGE_LICENSE GPL3)
set(CPACK_RPM_PACKAGE_URL ${HOMEPAGE_URL})
include(CPack)
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE")
set(CPACK_RESOURCE_FILE_README "${CMAKE_CURRENT_SOURCE_DIR}/README.md")
set(CPACK_ARCHIVE_THREADS 0)
set(CPACK_THREADS 0)
