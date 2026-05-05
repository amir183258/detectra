import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Item {
// -------------------------------------------------------
// Output Actions
// -------------------------------------------------------
	// actions list
	property alias loadDetectorModelAction: loadDetectorModelId

// -------------------------------------------------------
// Input Properties
// -------------------------------------------------------
	// from backend
	property var objectDetectorController // loadDetectorModelAction 

// -------------------------------------------------------
// Main Actions
// -------------------------------------------------------
	// action for opening a detector model
	Action {
		id: loadDetectorModelId
		text: "Load a Detector Model"

		onTriggered: {
			loadDetectorModelDialogId.open()
		}
	}

	FileDialog {
		id: loadDetectorModelDialogId
		title: "Select a Detector Model"
		nameFilters: ["PyTorch Model (*.pt)"] // TODO this should be corrected to onnx models
		onAccepted: {
			objectDetectorController.loadModel(selectedFile)
		}
	}
}
