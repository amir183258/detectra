set(MODULE_NAME DetectorUI)
set(LIB_NAME ${MODULE_NAME}Lib)

qt_add_library(${LIB_NAME} STATIC)

set_target_properties(${LIB_NAME} PROPERTIES AUTOMOC ON)
target_link_libraries(${LIB_NAME} PRIVATE Qt6::Quick Qt6::QuickControls2)

qt_add_qml_module(${LIB_NAME}
	URI ${MODULE_NAME}
	OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${MODULE_NAME}

	QML_FILES
		MainWindow.qml
		components/MainToolBar.qml
		components/MainMenuBar.qml
		components/LeftPanel.qml
		components/RightPanel.qml
		components/BottomPanel.qml
		components/CenterViewer/CenterViewer.qml
		components/CenterViewer/ImageDropArea.qml
		components/CenterViewer/PlaceholderText.qml
)
