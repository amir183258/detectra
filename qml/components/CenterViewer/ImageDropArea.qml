import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Item {
	property bool dragActive: dropAreaId.containsDrag

	/* for test */
	property alias dropArea: dropAreaId
	property alias errorDialog: errorDialogId

	signal imageDropped(url fileUrl)

	/* message dialog for invalid files in drop area */
	MessageDialog {
		id: errorDialogId
		title: "Invalid File"
	}

	/* function that check if file is image or not */
	function isImageFile(url) {
		let path = url.toString().toLowerCase()
		return  path.endsWith(".png") ||
			path.endsWith(".jpg") ||
			path.endsWith(".gif") ||
			path.endsWith(".bmp") ||
			path.endsWith(".jpeg")
	}

	/* drop area for opening an image */
	DropArea {
		id: dropAreaId
		anchors.fill: parent

		onDropped: function(drop) {
			if (!drop.hasUrls)
				return

			if (drop.urls.length > 1) {
				errorDialogId.text = "Please drop only one image."
				errorDialogId.open()
				return
			}

			let fileUrl = drop.urls[0]

			if (!isImageFile(fileUrl)) {
				errorDialogId.text = "The dropped file is not a supported image."
				errorDialogId.open()
				return
			}

			imageDropped(fileUrl)
			drop.acceptProposedAction()
		}

		/* for showing dropping an item */
		Rectangle {
			anchors.fill: parent
			color: "transparent"
			border.color: dropAreaId.containsDrag ? "dodgerblue" : "transparent"
			border.width: 3
		}
	}
}
