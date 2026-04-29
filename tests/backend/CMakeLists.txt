add_executable(tests_backend
	core/test_detector_box.cpp
	core/test_object_detector.cpp
	core/test_model_info.cpp
	core/test_detector_box_file_manager.cpp

	controllers/test_object_detector_controller.cpp
	controllers/test_detector_box_file_manager_controller.cpp
)

target_include_directories(tests_backend
	PRIVATE
		${CMAKE_SOURCE_DIR}/include
		${CMAKE_SOURCE_DIR}/tests/backend/mocks
)

target_link_libraries(tests_backend
	backend_engine

	GTest::GTest
	GTest::Main
	pthread

	Qt6::Core
	Qt6::Gui
)

set_target_properties(tests_backend PROPERTIES
	AUTOMOC ON
	AUTOUIC ON
	AUTORCC ON
)

# create a folder in executable file directory
add_custom_command(
	TARGET tests_backend POST_BUILD
	COMMAND ${CMAKE_COMMAND} -E make_directory "$<TARGET_FILE_DIR:tests_backend>/test_files"
)
