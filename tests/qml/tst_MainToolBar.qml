import QtQuick
import QtQuick.Controls
import QtTest
import DetectorUI

TestCase {
	name: "MainToolBarTests"

	Component {
		id: comp
		MainToolBar { }
	}

	Component {
		id: fakeActionsComp

		Item {
			property bool openCalled: false
			property bool resetCalled: false
			property bool loadModelCalled: false

			Action {
				id: openAct
				onTriggered: openCalled = true
			}

			Action {
				id: resetAct
				onTriggered: resetCalled = true
			}

			Action {
				id: loadModelAct
				onTriggered: loadModelCalled = true
			}

			property alias openImageAction: openAct
			property alias resetViewAction: resetAct
			property alias loadDetectorModelAction: resetAct
		}
	}

	Item {
		id: root
		width: 400
		height: 100
		visible: true
	}

	function createToolbar() {
		let fake = fakeActionsComp.createObject(root)

		let bar = comp.createObject(root, {
			imageActions: fake,
			detectionActions: fake
		})

		verify(bar !== null)

		return bar
	}
		
	function test_button_exist() {
		let bar = createToolbar()

		let layout = bar.contentChildren[0]

		compare(layout.children.length, 4) /* currently we have 3 buttons */
	}
}
