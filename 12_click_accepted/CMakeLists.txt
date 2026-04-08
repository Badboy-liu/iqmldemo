
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)
add_executable(12_click_accepted main.cpp
        )

target_link_libraries(12_click_accepted PRIVATE
        Qt6::Core
        Qt6::Quick
        Qt6::Sql
        Qt6::Concurrent
        common)




#qt_add_resources(RESOURCES qml.qrc)
#target_sources(12_click_accepted PRIVATE ${RESOURCES})
qt_add_qml_module(12_click_accepted
    URI App
    QML_FILES
        qml/Main.qml
#        RESOURCES images.qrc
#        RESOURCES images/img.jpeg
)



include(GNUInstallDirs)
install(TARGETS 12_click_accepted
        BUNDLE DESTINATION ..
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}/01
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}/01
)
message(STATUS "CMAKE_INSTALL_LIBDIR = ${CMAKE_INSTALL_LIBDIR}")
message(STATUS "CMAKE_INSTALL_BINDIR = ${CMAKE_INSTALL_BINDIR}")


if (MSVC)
    add_custom_command(TARGET 12_click_accepted POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E make_directory
            $<TARGET_FILE_DIR:12_click_accepted>/platforms

            COMMAND ${CMAKE_COMMAND} -E copy
            #            "${_VCPKG_INSTALLED_DIR}/x64-windows/tools/Qt6/plugins/platforms/qwindows$<$<CONFIG:Debug>:d>.dll"
            "${_VCPKG_INSTALLED_DIR}/x64-windows/$<$<CONFIG:Debug>:debug/>/Qt6/plugins/platforms/qwindows$<$<CONFIG:Debug>:d>.dll"
            "$<TARGET_FILE_DIR:12_click_accepted>/platforms"
    )
endif()
