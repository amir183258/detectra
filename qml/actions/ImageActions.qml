import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Item {
// -------------------------------------------------------
// Output Actions
// -------------------------------------------------------
	// actions list
	property alias openImageAction: openImageId
	property alias resetViewAction: resetViewId
	
// -------------------------------------------------------
// Input Properties
// -------------------------------------------------------
	// from main image viewer panel
	property var imageViewer // openImageAction,
				 // resetViewAction

// -------------------------------------------------------
// Main Actions
// -------------------------------------------------------
	// action for opening image
	Action {
		id: openImageId
		text: "Open Image"

		onTriggered: openImageDialogId.open()
	}

	// TODO there should be a tiff format
	FileDialog {
		id: openImageDialogId
		objectName: "openImageDialogObject"

		title: "Open Image"
		nameFilters: ["Images (*.png *.jpg *.jpeg *.bmp)"]

		onAccepted: function() {
			imageViewer.mainImage.source= selectedFile
		}
	}

	//
	//
	//

	// action for setting zoom and pan to default values
	Action {
		id: resetViewId
		text: "Reset View"
		enabled: imageViewer && imageViewer.mainImage.status === Image.Ready

		onTriggered: {
			imageViewer.resetView()
		}
	}
}
