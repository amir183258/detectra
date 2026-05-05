import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ToolBar {
// -------------------------------------------------------
// Input Actions
// -------------------------------------------------------
	property var imageActions
	property var detectionActions
	property var boxManagerActions

// -------------------------------------------------------
// Main Toolbar
// -------------------------------------------------------
	RowLayout {
		//TODO think more about these sizes
		spacing: 4
		anchors.fill: parent

		// TODO think about the order of these toolbars
		// open an image to image viewer
		ToolButton {
			action: imageActions.openImageAction
		}

		// reset viewer to default
		ToolButton {
			action: imageActions.resetViewAction
		}

		// load a detection model
		ToolButton {
			action: detectionActions.loadDetectorModelAction
		}

		// load a detection box file
		ToolButton {
			action: boxManagerActions.loadDetectorBoxesAction
		}

		//
		//
		//

		// this is spacer to shift tools to the left of toolbar
		Item {
			Layout.fillWidth: true
		}
	}
}
