import QtQuick
import QtTest
import DetectorUI

TestCase {
	name: "DetectionActionsTests"

	Component {
		id: comp
		DetectionActions { }
	}

	Item {
		id: root
		width: 400
		height: 300
		visible: true
	}

	property var item

	function init() {
		item = createTemporaryObject(comp, root)
		verify(item !== null)
	}

	function test_actions_exist() {
		verify(item.loadDetectorModelAction !== undefined)

		compare(item.loadDetectorModelAction.text, "Load a Detection Model")
	}
}
