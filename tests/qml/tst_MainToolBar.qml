import QtQuick
import QtQuick.Controls
import QtTest
import DetectorUI

TestCase {
	name: "toolBarTests"

	Component {
		id: comp
		MainToolBar { }
	}

	Component {
		id: fakeActionsComp

		Item {
			property bool openCalled: false
			property bool resetCalled: false

			Action {
				id: openAct
				onTriggered: openCalled = true
			}

			Action {
				id: resetAct
				onTriggered: resetCalled = true
			}

			property alias openImageAction: openAct
			property alias resetViewAction: resetAct
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
			imageActions: fake
		})

		verify(bar !== null)

		return bar
	}
		
	function test_button_exist() {
		let bar = createToolbar()

		let layout = bar.contentChildren[0]

		compare(layout.children.length, 3) /* currently we have 3 buttons */
	}
}
