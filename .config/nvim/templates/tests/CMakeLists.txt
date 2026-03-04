find_package(check REQUIRED CONFIG)

add_executable(check_{{ expand('%:p:h:h:t') }} check_{{ expand('%:p:h:h:t') }}.c)
target_compile_options(check_{{ expand('%:p:h:h:t') }} -fprofile-arcs -ftest-coverage)
target_link_libraries(check_{{ expand('%:p:h:h:t') }} check gcov)
add_test(NAME {{ expand('%:p:h:h:t') }} COMMAND check_{{ expand('%:p:h:h:t') }})

add_custom_command(
  OUTPUT check_{{ expand('%:p:h:h:t') }}.c
  COMMAND checkmk ${CMAKE_CURRENT_SOURCE_DIR}/check_{{ expand('%:p:h:h:t') }}.c.in > check_{{ expand('%:p:h:h:t') }}.c)
