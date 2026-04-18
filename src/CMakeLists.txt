add_library(backend_engine
	controllers/object_detector_controller.cpp
	controllers/register_controllers.cpp

	${CMAKE_SOURCE_DIR}/include/controllers/object_detector_controller.hpp
)

target_include_directories(backend_engine PUBLIC
	${CMAKE_SOURCE_DIR}/include
	$<$<CONFIG:Debug>:${CMAKE_SOURCE_DIR}/tests/backend/mocks>
)

target_link_libraries(backend_engine
	Qt6::Core
	Qt6::Gui
	Qt6::Qml
	Qt6::Quick
)

set_target_properties(backend_engine PROPERTIES
	AUTOMOC ON
	AUTOUIC ON
	AUTORCC ON
)
