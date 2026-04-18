import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ColumnLayout {
	property var objectDetectorController

	Frame {
		Layout.preferredWidth: 400
		Layout.fillHeight: true
	}

	Frame {
		Layout.preferredWidth: 400
		Layout.preferredHeight: 200
		padding: 10

		ColumnLayout {
			spacing: 6

			Label {
				text: "Model Info"
				font.bold: true
				font.pixelSize: 16
				Layout.fillWidth: true
			}

			Label {
				id: nameId
				text: "Name: <none>"
				Layout.fillWidth: true
			}

			Label {
				id: formatId
				text: "Format: <none>"
				Layout.fillWidth: true
			}

			// TODO think something for file path
			/*
			Label {
				id: filePathId
				text: "File Path: <none>"
				Layout.fillWidth: true
			}
			*/

			Label {
				id: fileSizeId
				text: "File Size (Bytes): <none>"
				Layout.fillWidth: true
			}

			Label {
				id: inputSizeId
				text: "Input Size: <none>"
				Layout.fillWidth: true
			}

			Label {
				id: numClassesId 
				text: "Number of Classes: <none>"
				Layout.fillWidth: true
			}

			Label {
				id: classNamesId
				text: "Class Names: <none>"
				Layout.fillWidth: true
			}
		}

	}

	Connections {
		target: objectDetectorController
		function onModelInfoChanged() {
			console.log(objectDetectorController.modelInfo.modelName)

			// fill labels
			nameId.text = "Name: " + objectDetectorController.modelInfo.modelName
			formatId.text = "Format: " + objectDetectorController.modelInfo.format
			fileSizeId.text = "File Size (Bytes): " + objectDetectorController.modelInfo.fileSize
			inputSizeId.text = "Input Size: " + objectDetectorController.modelInfo.inputWidth + " x " + objectDetectorController.modelInfo.inputHeight
			numClassesId.text = "Number of Class: " + objectDetectorController.modelInfo.numClasses
			classNamesId.text = "Class Names: " + objectDetectorController.modelInfo.classNames

			// TODO think something for file path
			//filePathId.text = "File Path: " + objectDetectorController.modelInfo.filePath
		}
	}
}
