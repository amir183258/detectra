import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Item {
	// actions
	property alias loadDetectorModelAction: loadDetectorModelId

	FileDialog {
		id: modelDialogId
		title: "Select a Detection Model"
		nameFilters: ["PyTorch Model (*.pt)"] // TODO this should be corrected to onnx models
		onAccepted: {
			console.log("Selected model: ", selectedFile)
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
