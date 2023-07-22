enable_testing()
find_package(GTest REQUIRED)
include_directories("${CMAKE_SOURCE_DIR}/src")
add_executable(main_test main_test.cc)
target_link_libraries(main_test ${GTEST_MAIN_LIBRARIES})

include(GoogleTest)
gtest_discover_tests(main_test)
