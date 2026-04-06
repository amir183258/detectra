import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ToolBar {
	property var imageActions

	RowLayout {
		anchors.fill: parent

		ToolButton {
			action: imageActions.openImageAction
		}

		ToolButton {
			action: imageActions.resetViewAction
		}

		ToolButton { text: "Detect" }
	}
}
