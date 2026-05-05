import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
// -------------------------------------------------------
// Input Properties
// -------------------------------------------------------
	// from LeftPanle and its ListModel
	property var modelReference
	
// -------------------------------------------------------
// Initialization
// -------------------------------------------------------
	width: ListView.view.width
	height: 40

// -------------------------------------------------------
// Main
// -------------------------------------------------------
	RowLayout {
		anchors.fill: parent

		CheckBox {
			checked: check_box_visible

			onCheckedChanged: {
				model.check_box_visible = checked
			}
		}

		Label {
			text: model.file_name.toString().split("/").pop()
			Layout.fillWidth: true
		}

		// TODO check this element in documentation
		ToolButton {
			text: "×"
			onClicked: {
				modelReference.remove(index)
			}
		}
	}
}
