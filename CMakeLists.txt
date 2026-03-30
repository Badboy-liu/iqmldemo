cmake_minimum_required(VERSION 4.1)
project(iqmldemo)

set(CMAKE_CXX_STANDARD 20)
find_package(Qt6 COMPONENTS
        Core Widgets Gui    OpenGL Qml  Quick
        QuickControls2
        OpenGLWidgets OpenGL Multimedia test
        REQUIRED)

add_subdirectory(01)
add_subdirectory(common)

