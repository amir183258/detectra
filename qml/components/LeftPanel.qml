import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ColumnLayout {
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
				text: "Name: <none>"
				Layout.fillWidth: true
			}

			Label {
				text: "Format: <none>"
				Layout.fillWidth: true
			}

			Label {
				text: "Size: -"
				Layout.fillWidth: true
			}

			Label {
				text: "Input: -"
				Layout.fillWidth: true
			}

			Label {
				text: "Precision: -"
				Layout.fillWidth: true
			}
		}

	}
}
