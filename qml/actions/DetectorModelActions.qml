import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Item {
// -------------------------------------------------------
// Output Actions
// -------------------------------------------------------
	// actions list
	property alias loadDetectorModelAction: loadDetectorModelId
	property alias applyDetectorModelAction: applyDetectorModelId

// -------------------------------------------------------
// Input Properties
// -------------------------------------------------------
	// from backend
	property var objectDetectorController // loadDetectorModelAction 
	
	// from CenterViewer.qml
	property var centerViewer // applyDetectorModelAction

	// from LeftPanel.qml
	property var leftPanel // applyDetectorModelAction

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

	//
	//
	//

	// action for applying the detector model
	Action {
		id: applyDetectorModelId
		text: "Apply The Detector Model"
		// enable when there is an image in center viewer
		enabled: centerViewer.mainImage.status === Image.Ready && objectDetectorController.ready

		onTriggered: {
			var boxes = objectDetectorController.runOnImage(centerViewer.mainImage.source)

			// TODO cant repeat a model on the image
			leftPanel.add_to_boxes_list_model("Memory", boxes)
		}
	}

}
