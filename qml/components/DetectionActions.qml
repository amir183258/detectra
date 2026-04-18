import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Item {
	property var objectDetectorController
	// actions
	property alias loadDetectorModelAction: loadDetectorModelId

	FileDialog {
		id: modelDialogId
		title: "Select a Detection Model"
		nameFilters: ["PyTorch Model (*.pt)"] // TODO this should be corrected to onnx models
		onAccepted: {
			objectDetectorController.loadModel(selectedFile)
			console.log("controller loaded!") // TODO for test
			console.log(objectDetectorController.modelInfo.modelName)
		}
	}

	Action {
		id: loadDetectorModelId
		text: "Load a Detection Model"

		onTriggered: {
			modelDialogId.open()
		}
	}
}
