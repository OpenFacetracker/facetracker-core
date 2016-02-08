cmake_minimum_required(VERSION 3.3)
project(facetracker_core)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(SOURCE_FILES
    Camera/recognition/ft_recognise.cpp
    Camera/ft_detect.cpp
    Camera/ft_draw.cpp
    Console/ft_console.cpp
    DB/ft_db.cpp
    Header/color.h
    Header/ft.h
    Header/ft_draw.h
    Header/ft_recognise.h
    Header/Image.h
    Header/secure.h
    Header/XmlParsing.h
    Utils/ft_config.cpp
    Utils/ft_log.cpp
    Utils/ft_main.cpp
    Utils/ft_parser.cpp
    Utils/ft_secure.cpp
    Utils/ft_utils.cpp)

add_executable(facetracker_core ${SOURCE_FILES})
find_package( OpenCV )
include_directories( ${OpenCV_INCLUDE_DIRS} )
target_link_libraries( facetracker_core ${OpenCV_LIBS} )