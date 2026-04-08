cmake_minimum_required(VERSION 4.1)
project(iqmldemo)

set(CMAKE_CXX_STANDARD 20)
find_package(Qt6 COMPONENTS
        Core Widgets Gui    OpenGL Qml  Quick
        QuickControls2
        OpenGLWidgets OpenGL Multimedia test Svg sql
        REQUIRED)
#find_package(unofficial-mysql-connector-cpp CONFIG REQUIRED)

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
add_subdirectory(06_combobox)
add_subdirectory(07_cpp_qml)
add_subdirectory(08_mvvm)
add_subdirectory(09_layout)
add_subdirectory(10_delay_button)
add_subdirectory(11_qimage)
add_subdirectory(12_click_accepted)

add_subdirectory(common)

