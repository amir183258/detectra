add_executable (detector
	main.cpp
)

target_link_libraries(detector PRIVATE
	Qt6::Quick
	Qt6::QuickControls2
	DetectorUILibplugin
)

set_target_properties(detector PROPERTIES
	AUTOMOC ON
	AUTOUIC ON
	AUTORCC ON
)
