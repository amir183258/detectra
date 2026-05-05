import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
// -------------------------------------------------------
// Output Properties
// -------------------------------------------------------
	property alias detectorBoxesListModel: detectorBoxesListModelId

// -------------------------------------------------------
// Input Properties
// -------------------------------------------------------
	// from backend
	// for bottom frame, model information
	property var objectDetectorController

// -------------------------------------------------------
// Functions
// -------------------------------------------------------
	// this function should add detector boxes to list view
	function add_to_boxes_list_model(file_path, boxes) {
		detectorBoxesListModelId.append({
			// these are roles
			file_name: file_path,
			detector_boxes: boxes,
			check_box_visible: true
		})
	}

// -------------------------------------------------------
// Data Models
// -------------------------------------------------------
	// list model for detector boxes information
	ListModel {
		id: detectorBoxesListModelId
	}

// -------------------------------------------------------
// Initialization
// -------------------------------------------------------
	Layout.preferredWidth: 400
	Layout.fillHeight: true

	// these variables are for ease of use
	// these variables are used in the bottom frame
	property var is_model_ready: objectDetectorController.ready

	property var model_name: objectDetectorController.modelInfo.modelName
	property var format: objectDetectorController.modelInfo.format
	property var file_path: objectDetectorController.modelInfo.filePath // is not shown in bottom frame
	property var file_size: objectDetectorController.modelInfo.fileSize
	property var input_width: objectDetectorController.modelInfo.inputWidth
	property var input_height: objectDetectorController.modelInfo.inputHeight
	property var num_classes: objectDetectorController.modelInfo.numClasses
	property var class_names: objectDetectorController.modelInfo.classNames

// -------------------------------------------------------
// Main
// -------------------------------------------------------
	ColumnLayout {
		anchors.fill: parent

		// top frame for detector boxes
		Frame {
			Layout.fillWidth: true
			Layout.fillHeight: true
			padding: 10

			ColumnLayout {
				anchors.fill: parent

				Label {
					text: "Detector Boxes"
					font.bold: true
					font.pixelSize: 16
				}

				ListView {
					Layout.fillWidth: true
					Layout.fillHeight: true

					model: detectorBoxesListModelId

					// tip: brackets are very important
					// from delegates
					delegate: DetectorBoxesDelegate {
						// inputs
						modelReference: detectorBoxesListModelId
					} 
				}
			}
		}

		//
		//
		//

		// bottom frame for the loaded model information
		Frame {
			Layout.fillWidth: true
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
					text: "Name: " + (is_model_ready ? model_name : "<none>")
					Layout.fillWidth: true
				}

				Label {
					id: formatId
					text: "Format: " + (is_model_ready ? format : "<none>")
					Layout.fillWidth: true
				}

				Label {
					id: fileSizeId
					text: "File Size (Bytes): " + (is_model_ready ? file_size : "<none>")
					Layout.fillWidth: true
				}

				Label {
					id: inputSizeId
					text: "Input Size: " + (is_model_ready ? input_width + "×" + input_height :  "<none>")
					Layout.fillWidth: true
				}

				Label {
					id: numClassesId 
					text: "Number of Classes: " + (is_model_ready ? num_classes : "<none>")
					Layout.fillWidth: true
				}

				Label {
					id: classNamesId
					text: "Class Names: " + (is_model_ready ? class_names : "<none>")
					Layout.fillWidth: true
				}
			}
		}
	}
}
