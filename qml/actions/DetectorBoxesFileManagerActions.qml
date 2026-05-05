import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Item {
// -------------------------------------------------------
// Output Actions
// -------------------------------------------------------
	// actions list
	property alias loadDetectorBoxesAction: loadDetectorBoxesId

// -------------------------------------------------------
// Input Properties
// -------------------------------------------------------
	// from main left panel
	property var leftPanel 			// loadDetectorBoxesAction

	// from backend
	property var boxManagerController 	// loadDetectorBoxes Action

// -------------------------------------------------------
// Main Actions
// -------------------------------------------------------
	Action {
		id: loadDetectorBoxesId
		text: "Load Detector Boxes"

		onTriggered: {
			loadDetectorBoxesDialogId.open()
		}
	}

	FileDialog {
		id: loadDetectorBoxesDialogId
		title: "Select Detector Boxes Files"
		nameFilters: ["Detector Box (*.dbox)"]
		onAccepted: {
			// read boxes from the files
			var boxes = boxManagerController.loadBoxes(selectedFile)

			// TODO else show an error message
			if (boxes.length > 0)
				leftPanel.add_to_boxes_list_model(selectedFile, boxes)
		}
	}
}
