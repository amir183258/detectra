import QtQuick
import QtTest
import DetectorUI

TestCase {
	name: "CenterViewerTests"

	Component {
		id: comp
		CenterViewer { }
	}

	Item {
		id: root
		width: 800
		height: 600
		visible: true
	}

	property var viewer

	function init() {
		viewer = createTemporaryObject(comp, root)
		verify(viewer !== null)
	}

	function test_initial_state() {
		compare(viewer.zoom, 1.0)
		compare(viewer.offsetX, 0)
		compare(viewer.offsetY, 0)

		compare(viewer.startX, 0)
		compare(viewer.startY, 0)

		compare(viewer.imageFileName, "No Image")
	}

	function test_resetView() {
		viewer.zoom = 3
		viewer.offsetX = 100
		viewer.offsetY = -50
		viewer.startX = 10
		viewer.startY = 20

		viewer.resetView()

		compare(viewer.zoom, 1.0)
		compare(viewer.offsetX, 0)
		compare(viewer.offsetY, 0)

		compare(viewer.startX, 0)
		compare(viewer.startY, 0)
	}
}
