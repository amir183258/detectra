qt_add_executable(qml_tests
	main.cpp
)

target_link_libraries(qml_tests PRIVATE Qt6::QuickTest)

qt_add_qml_module(qml_tests
	URI DetectorTests
	QML_FILES
		tst_MainWindow.qml
		tst_BottomPanel.qml
)

target_link_libraries(qml_tests PRIVATE DetectorUILibplugin)
