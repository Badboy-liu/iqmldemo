
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)
add_executable(08_mvvm main.cpp
        dao/UserDao.cpp
        dao/UserDao.h
        entity/User.cpp
        entity/User.h
        db/DatabaseManager.cpp
        db/DatabaseManager.h
        service/UserService.cpp
        service/UserService.h
        service/UserRepository.cpp
        service/UserRepository.h
        model/UserListModel.cpp
        model/UserListModel.h
        model/UserViewModel.cpp
        model/UserViewModel.h
        req/UserPageReq.cpp
        req/UserPageReq.h
        req/PageReq.cpp
        req/PageReq.h
        req/PageResult.cpp
        req/PageResult.h)

target_link_libraries(08_mvvm PRIVATE
        Qt6::Core
        Qt6::Quick
        Qt6::Sql
        Qt6::Concurrent
        common)




#qt_add_resources(RESOURCES qml.qrc)
#target_sources(08_mvvm PRIVATE ${RESOURCES})
qt_add_qml_module(08_mvvm
    URI App
    QML_FILES qml/Main.qml

)


include(GNUInstallDirs)
install(TARGETS 08_mvvm
        BUNDLE DESTINATION ..
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}/01
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}/01
)
message(STATUS "CMAKE_INSTALL_LIBDIR = ${CMAKE_INSTALL_LIBDIR}")
message(STATUS "CMAKE_INSTALL_BINDIR = ${CMAKE_INSTALL_BINDIR}")


if (MSVC)
    add_custom_command(TARGET 08_mvvm POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E make_directory
            $<TARGET_FILE_DIR:08_mvvm>/platforms

            COMMAND ${CMAKE_COMMAND} -E copy
            #            "${_VCPKG_INSTALLED_DIR}/x64-windows/tools/Qt6/plugins/platforms/qwindows$<$<CONFIG:Debug>:d>.dll"
            "${_VCPKG_INSTALLED_DIR}/x64-windows/$<$<CONFIG:Debug>:debug/>/Qt6/plugins/platforms/qwindows$<$<CONFIG:Debug>:d>.dll"
            "$<TARGET_FILE_DIR:08_mvvm>/platforms"
    )
endif()
