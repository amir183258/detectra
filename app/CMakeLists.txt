add_executable (detector
	main.cpp
)

target_include_directories(detector PRIVATE
	${CMAKE_SOURCE_DIR}/include
	$<$<CONFIG:Debug>:${CMAKE_SOURCE_DIR}/tests/backend/mocks>
)

target_link_libraries(detector PRIVATE
	backend_engine

	Qt6::Quick
	Qt6::QuickControls2
	DetectorUILibplugin
)

set_target_properties(detector PROPERTIES
	AUTOMOC ON
	AUTOUIC ON
	AUTORCC ON
)
