add_executable(tests_backend
	core/test_detector_box.cpp
)

target_include_directories(tests_backend
	PRIVATE
		${CMAKE_SOURCE_DIR}/include
)

target_link_libraries(tests_backend
	GTest::GTest
	GTest::Main
	pthread

	Qt6::Core
	Qt6::Gui
)
