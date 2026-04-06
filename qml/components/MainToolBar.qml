import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ToolBar {
	RowLayout {
		anchors.fill: parent

		ToolButton { text: "Open" }
		ToolButton { text: "Zoom" }
		ToolButton { text: "Detect" }
	}
}
