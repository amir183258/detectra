import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import DetectorUI

import BackendEngine

ApplicationWindow {
// -------------------------------------------------------
// Initial Window 
// -------------------------------------------------------
	id: rootId

	title: "Detector"

	// window size
	width: 1280
	height: 720

	visibility: Window.Maximized
	visible: true

	// set font size
	font.pointSize: 11

	// set position center
	Component.onCompleted: {
		x = (screen.width - width) / 2
		y = (screen.height - height) / 2
	}

// -------------------------------------------------------
// Actions
// -------------------------------------------------------
	// image actions
	ImageActions {
		id: imageActionsId
		objectName: "imageActionsObject"

		// inputs
		imageViewer: centerViewerId
	}

	// detector actions
	DetectorModelActions {
		id: detectorModelActionsId

		// inputs
		objectDetectorController: objectDetectorModelControllerId
	}

	// file manager actions
	DetectorBoxesFileManagerActions {
		id: detectorBoxesFileManagerActionsId

		// inputs
		boxManagerController: detectorBoxesFileManagerControllerId
		leftPanel: leftPanelId
	}

// -------------------------------------------------------
// Main
// -------------------------------------------------------
	menuBar: MainMenuBar {
		// inputs
		imageActions: imageActionsId
		detectionActions: detectorModelActionsId
		boxManagerActions: detectorBoxesFileManagerActionsId
	}

	header: MainToolBar {
		// inputs
		imageActions: imageActionsId
		detectionActions: detectorModelActionsId
		boxManagerActions: detectorBoxesFileManagerActionsId
	}

	ColumnLayout {
		anchors.fill: parent

		RowLayout {
			Layout.fillWidth: true
			Layout.fillHeight: true

			LeftPanel {
				id: leftPanelId

				// inputs
				objectDetectorController: objectDetectorModelControllerId
			}

			CenterViewer {
				id: centerViewerId
				objectName: "centerViewerObject"

				// inputs
				detectorBoxesListModel: leftPanelId.detectorBoxesListModel
			}
		}

		BottomPanel {
			id: bottomPanelId
			objectName: "bottomPanelObject"

			// inputs
			centerViewer: centerViewerId
		}
	}

// -------------------------------------------------------
// Backend
// -------------------------------------------------------
	// backend controllers
	ObjectDetectorController {
		id: objectDetectorModelControllerId
	}

	DetectorBoxFileManagerController {
		id: detectorBoxesFileManagerControllerId
	}
}
