import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Item {
// -------------------------------------------------------
// Output Properties
// -------------------------------------------------------
	property bool dragActive: dropAreaId.containsDrag

	// for test
	property alias dropArea: dropAreaId
	property alias errorDialog: errorDialogId

// -------------------------------------------------------
// Input Properties
// -------------------------------------------------------
	property var centerViewer

// -------------------------------------------------------
// Functions
// -------------------------------------------------------
	// function that check if file is image or not
	function isImageFile(url) {
		let path = url.toString().toLowerCase()
		return  path.endsWith(".png") ||
			path.endsWith(".jpg") ||
			path.endsWith(".gif") ||
			path.endsWith(".bmp") ||
			path.endsWith(".jpeg")
	}

// -------------------------------------------------------
// Main
// -------------------------------------------------------
	// message dialog for invalid files in drop area
	MessageDialog {
		id: errorDialogId
		title: "Invalid File"
	}

	// drop area for opening an image
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

			// set center viewer and reset pan and zoom
			centerViewer.mainImage.source = fileUrl

			centerViewer.zoom = 1.0
			centerViewer.offsetX = 0
			centerViewer.offsetY = 0

			drop.acceptProposedAction()
		}

		// for showing dropping an item
		Rectangle {
			anchors.fill: parent
			color: "transparent"
			border.color: dropAreaId.containsDrag ? "dodgerblue" : "transparent"
			border.width: 3
		}
	}
}
