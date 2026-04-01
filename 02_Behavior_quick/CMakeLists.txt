

add_executable(02_Behavior_quick main.cpp)
target_link_libraries(02_Behavior_quick PRIVATE
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
install(TARGETS 02_Behavior_quick
        BUNDLE DESTINATION ..
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}/01
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}/01
)
message(STATUS "CMAKE_INSTALL_LIBDIR = ${CMAKE_INSTALL_LIBDIR}")
message(STATUS "CMAKE_INSTALL_BINDIR = ${CMAKE_INSTALL_BINDIR}")
qt_add_resources(RESOURCES qml.qrc)
target_sources(02_Behavior_quick PRIVATE ${RESOURCES})

if (MSVC)
    add_custom_command(TARGET 02_Behavior_quick POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E make_directory
            $<TARGET_FILE_DIR:02_Behavior_quick>/platforms

            COMMAND ${CMAKE_COMMAND} -E copy
            #            "${_VCPKG_INSTALLED_DIR}/x64-windows/tools/Qt6/plugins/platforms/qwindows$<$<CONFIG:Debug>:d>.dll"
            "${_VCPKG_INSTALLED_DIR}/x64-windows/$<$<CONFIG:Debug>:debug/>/Qt6/plugins/platforms/qwindows$<$<CONFIG:Debug>:d>.dll"
            "$<TARGET_FILE_DIR:02_Behavior_quick>/platforms"
    )
endif()

