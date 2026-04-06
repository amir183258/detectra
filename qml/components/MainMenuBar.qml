import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

MenuBar {
	signal openImage(url file)

	FileDialog {
		id: openDialogId
		title: "Open Image"
		nameFilters: ["Images (*.png *.jpg *.jpeg *.bmp)"]

		onAccepted: function() {
			openImage(selectedFile)
		}
	}

	Menu {
		title: "File"

		MenuItem {
			text: "Open"
			onTriggered: function() {
				openDialogId.open()
			}
		}

		MenuItem { text: "Save" }
		MenuItem { text: "Save As..." }
		MenuSeparator {}
		MenuItem { text: "Exit"; onTriggered: Qt.quit() }
	}

	Menu {
		title: "Edit"

		MenuItem { text: "Undo" }
		MenuItem { text: "Redo" }
		MenuSeparator {}
		MenuItem { text: "Cut" }
		MenuItem { text: "Copy" }
		MenuItem { text: "Paste" }
	}

	font.pixelSize: 12
}
