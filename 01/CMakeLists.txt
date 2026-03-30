

add_executable(demo1 main.cpp)
target_link_libraries(demo1 PRIVATE
        Qt::Core
        Qt::Widgets
        Qt::Gui
        Qt::Qml
        Qt::Quick
        Qt::QuickControls2
        Qt::OpenGL
        Qt::OpenGLWidgets
        common
)

include(GNUInstallDirs)
install(TARGETS demo1
        BUNDLE DESTINATION ..
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}/01
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}/01
)
message(STATUS "CMAKE_INSTALL_LIBDIR = ${CMAKE_INSTALL_LIBDIR}")
message(STATUS "CMAKE_INSTALL_BINDIR = ${CMAKE_INSTALL_BINDIR}")
qt_add_resources(RESOURCES qml.qrc)
target_sources(demo1 PRIVATE ${RESOURCES})

if (MSVC)
    add_custom_command(TARGET demo1 POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E make_directory
            $<TARGET_FILE_DIR:demo1>/platforms

            COMMAND ${CMAKE_COMMAND} -E copy
            #            "${_VCPKG_INSTALLED_DIR}/x64-windows/tools/Qt6/plugins/platforms/qwindows$<$<CONFIG:Debug>:d>.dll"
            "${_VCPKG_INSTALLED_DIR}/x64-windows/$<$<CONFIG:Debug>:debug/>/Qt6/plugins/platforms/qwindows$<$<CONFIG:Debug>:d>.dll"
            "$<TARGET_FILE_DIR:demo1>/platforms"
    )
endif()

