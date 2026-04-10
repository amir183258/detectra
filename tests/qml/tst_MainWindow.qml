import QtQuick
import QtTest
import DetectorUI

TestCase {
	name: "MainWindowTests"

	Component {
		id: windowComponent
		MainWindow {}
	}

	function test_windowCreation() {
		var window = createTemporaryObject(windowComponent, null)
		
		verify(window != null)
		verify(window.title, "Detector")
	}


	function test_windowSize() {
		var window = createTemporaryObject(windowComponent, null)

		compare(window.width, 1280)
		compare(window.height, 720)
	}

	function test_centerViewerExists() {
		var window = createTemporaryObject(windowComponent, null)

		var viewer = findChild(window, "centerViewerObject")

		verify(viewer !== null)
	}

	function test_imageActionsConnection() {
		var window = createTemporaryObject(windowComponent, null)

		var viewer = findChild(window, "centerViewerObject")
		var actions = findChild(window, "imageActionsObject")

		compare(actions.imageViewer, viewer)
	}

	function test_panelExist() {
		var window = createTemporaryObject(windowComponent, null)

		verify(window !== null)

		var children = window.contentItem.children
		verify(children.length > 0)
	}

	function test_menuAndToolbar() {
		var window = createTemporaryObject(windowComponent, null)

		verify(window.menuBar !== null)
		verify(window.header !== null)
	}

	function test_bottomPanelConnectionsToImageViewer() {
		var window = createTemporaryObject(windowComponent, null)

		var viewer = findChild(window, "centerViewerObject")
		var actions = findChild(window, "bottomPanelObject")

		compare(actions.imageFileName, viewer.imageFileName)
		compare(actions.imageWidth, viewer.imageWidth)
		compare(actions.imageHeight, viewer.imageHeight)
	}
}
