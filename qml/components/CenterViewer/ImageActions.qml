import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Item {
	// actions
	property alias openImageAction: openImageId
	property alias resetViewAction: resetViewId

	// image viewer property
	property var imageViewer

	// action for opening image
	Action {
		id: openImageId
		text: "Open Image"

		onTriggered: openDialogId.open()
	}

	FileDialog {
		id: openDialogId
		objectName: "openDialogObject"

		title: "Open Image"
		nameFilters: ["Images (*.png *.jpg *.jpeg *.bmp)"]

		onAccepted: function() {
			imageViewer.imageSource = selectedFile
		}
	}

	// action for setting zoom and pan to default values
	Action {
		id: resetViewId
		text: "Reset View"
		enabled: imageViewer && imageViewer.imageStatus === Image.Ready

		onTriggered: {
			imageViewer.resetView()
		}
	}

}
