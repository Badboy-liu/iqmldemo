

add_executable(05_input_panel main.cpp)
target_link_libraries(05_input_panel PRIVATE
        Qt::Core
        Qt::Widgets
        Qt::Gui
        Qt::Qml
        Qt::Quick
        Qt::QuickControls2
        Qt::OpenGL
        Qt::OpenGLWidgets
        Qt::VirtualKeyboard
        Qt::VirtualKeyboardQml
        Qt::Svg
        Qt::SvgWidgets
        common
        ZXing::Core ZXing::ZXing
)

qt_add_resources(RESOURCES qml.qrc)
target_sources(05_input_panel PRIVATE ${RESOURCES})

include(GNUInstallDirs)
install(TARGETS 05_input_panel
        BUNDLE DESTINATION ..
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}/01
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}/01
)
message(STATUS "CMAKE_INSTALL_LIBDIR = ${CMAKE_INSTALL_LIBDIR}")
message(STATUS "CMAKE_INSTALL_BINDIR = ${CMAKE_INSTALL_BINDIR}")


if (MSVC)
    add_custom_command(TARGET 05_input_panel POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E make_directory
            $<TARGET_FILE_DIR:05_input_panel>/platforms

            COMMAND ${CMAKE_COMMAND} -E copy
            #            "${_VCPKG_INSTALLED_DIR}/x64-windows/tools/Qt6/plugins/platforms/qwindows$<$<CONFIG:Debug>:d>.dll"
            "${_VCPKG_INSTALLED_DIR}/x64-windows/$<$<CONFIG:Debug>:debug/>/Qt6/plugins/platforms/qwindows$<$<CONFIG:Debug>:d>.dll"
            "$<TARGET_FILE_DIR:05_input_panel>/platforms"
    )
endif()

