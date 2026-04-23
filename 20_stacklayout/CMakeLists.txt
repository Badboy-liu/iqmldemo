find_package(Qt6 REQUIRED COMPONENTS Qml)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)
add_executable(20_stacklayout main.cpp
        )

target_link_libraries(20_stacklayout PRIVATE
        Qt6::Core
        Qt6::Quick
        Qt6::Sql
        Qt6::Concurrent
        Qt6::Qml
        common)




#qt_add_resources(RESOURCES qml.qrc)
#target_sources(20_stacklayout PRIVATE ${RESOURCES})

qt_add_qml_module(20_stacklayout
    URI App
    QML_FILES
        qml/Main.qml
        qml/IndexPage.qml
        qml/AboutPage.qml
        qml/SettingPage.qml
#        RESOURCES images.qrc
#        RESOURCES images/img.jpeg
)



include(GNUInstallDirs)
install(TARGETS 20_stacklayout
        BUNDLE DESTINATION ..
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}/01
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}/01
)



if (MSVC)
    add_custom_command(TARGET 20_stacklayout POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E make_directory
            $<TARGET_FILE_DIR:20_stacklayout>/platforms

            COMMAND ${CMAKE_COMMAND} -E copy
            #            "${_VCPKG_INSTALLED_DIR}/x64-windows/tools/Qt6/plugins/platforms/qwindows$<$<CONFIG:Debug>:d>.dll"
            "${_VCPKG_INSTALLED_DIR}/x64-windows/$<$<CONFIG:Debug>:debug/>/Qt6/plugins/platforms/qwindows$<$<CONFIG:Debug>:d>.dll"
            "$<TARGET_FILE_DIR:20_stacklayout>/platforms"
    )
endif()
