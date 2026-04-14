import QtQuick
import QtQuick.Controls
import QtTest
import DetectorUI

TestCase {
	name: "MainMenuBarTests"

	Component {
		id: comp
		MainMenuBar { }
	}

	Component {
		id: fakeActionsComp
		Item {
			property bool actionOpenCalled: false
			property bool actionResetCalled: false

			Action {
				id: openAct
				objectName: "openImageAction"
				onTriggered: actionOpenCalled = true
			}

			Action {
				id: resetAct
				objectName: "resetViewAction"
				onTriggered: actionResetCall = true
			}

			property alias openImageAction: openAct
			property alias resetViewAction: resetAct
		}
	}

	Item {
		id: root
		width: 500
		height: 200
		visible: true
	}

	function createMenu() {
		let menu = comp.createObject(root)
		verify(menu !== null)

		let fake = fakeActionComp.createObject(menu)
		verify(fake !== null)

		menu.imageActions = fake
		return menu
	}
}
