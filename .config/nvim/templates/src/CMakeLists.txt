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
