import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ToolBar {
	property var imageActions
	property var detectionActions

	RowLayout {
		spacing: 4
		anchors.fill: parent

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

		// this is spacer to shift tools to the left of toolbar
		Item {
			Layout.fillWidth: true
		}
	}
}
