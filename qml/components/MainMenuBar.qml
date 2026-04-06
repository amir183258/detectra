import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

MenuBar {
	property var imageActions
	signal resetViewRequested()

	Menu {
		title: "File"

		MenuItem {
			action: imageActions.openImageAction
		}

		MenuItem {
			text: "Save Bounding Boxes"
		}

		MenuSeparator {}

		MenuItem { text: "Exit"; onTriggered: Qt.quit() }
	}

	Menu {
		title: "Edit"

		MenuItem {
			action: imageActions.resetViewAction
		}

		MenuItem { text: "Redo" }
		MenuSeparator {}
		MenuItem { text: "Cut" }
		MenuItem { text: "Copy" }
		MenuItem { text: "Paste" }
	}

	font.pixelSize: 12
}
