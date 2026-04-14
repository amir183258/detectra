add_executable(tests_backend
	core/test_detector_box.cpp
	core/test_object_detector.cpp
	core/test_model_info.cpp
)

target_include_directories(tests_backend
	PRIVATE
		${CMAKE_SOURCE_DIR}/include
		${CMAKE_SOURCE_DIR}/tests/backend/mocks
)

target_link_libraries(tests_backend
	GTest::GTest
	GTest::Main
	pthread

	Qt6::Core
	Qt6::Gui
)
