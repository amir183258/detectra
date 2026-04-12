import QtQuick
import QtTest
import DetectorUI

TestCase {
	name: "imageActionsTests"

	Component {
		id: comp
		ImageActions { }
	}

	Item {
		id: root
		width: 400
		height: 300
		visible: true
	}

	Component {
		id: fakeViewerComp

		Item {
			property var imageSource: ""
			function resetView() {
				resetCalled = true
			}
			property bool resetCalled: false
		}
	}

	property var item

	function init() {
		item = createTemporaryObject(comp, root)
		verify(item !== null)

		let fakeViewer = createTemporaryObject(fakeViewerComp, item)
		verify(fakeViewer !== null)

		item.imageViewer = fakeViewer
	}

	function test_actions_exist() {
		verify(item.openImageAction !== undefined)
		verify(item.resetViewAction !== undefined)

		compare(item.openImageAction.text, "Open Image")
		compare(item.resetViewAction.text, "Reset View")
	}

	function test_resetViewAction_calls_resetView() {
		let viewer = item.imageViewer

		compare(viewer.resetCalled, false)

		item.resetViewAction.trigger()

		compare(viewer.resetCalled, true)
	}
}
