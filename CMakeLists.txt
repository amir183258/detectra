cmake_minimum_required(VERSION 3.16)
project(Detector LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_BUILD_TYPE debug)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# gtest
find_package(GTest REQUIRED)

# Qt6
set(CMAKE_PREFIX_PATH "$ENV{HOME}/Qt/6.10.1/gcc_64")

find_package(Qt6 COMPONENTS Quick QuickControls2 QuickTest Qml Core Gui REQUIRED)

qt_standard_project_setup()

qt_policy(SET QTP0001 NEW)
qt_policy(SET QTP0004 NEW)

add_subdirectory(qml/)
add_subdirectory(app/)
add_subdirectory(tests/)
add_subdirectory(src/)
