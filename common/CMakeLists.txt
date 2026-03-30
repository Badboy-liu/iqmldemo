

set(CMAKE_CXX_STANDARD 20)

add_library(common STATIC constant.h constant.cpp)
target_link_libraries(common
        Qt6::Core
)
target_include_directories(common PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
)