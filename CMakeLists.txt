cmake_minimum_required(VERSION 4.1)
project(iqmldemo)

set(CMAKE_CXX_STANDARD 20)
find_package(Qt6 COMPONENTS
        Core Widgets Gui    OpenGL Qml  Quick
        QuickControls2
        OpenGLWidgets OpenGL Multimedia test Svg
        REQUIRED)
find_package(ZXing CONFIG REQUIRED)
find_package(Qt6VirtualKeyboard CONFIG REQUIRED)
find_package(Qt6VirtualKeyboardQml CONFIG REQUIRED)
find_package(Qt6HunspellInputMethod CONFIG REQUIRED)
find_package(Qt6Svg CONFIG REQUIRED)
find_package(Qt6SvgWidgets CONFIG REQUIRED)
add_subdirectory(01_application_window)
add_subdirectory(02_Behavior_quick)
add_subdirectory(03_blur)
add_subdirectory(04_button_delegate)
add_subdirectory(05_input_panel)

add_subdirectory(common)

