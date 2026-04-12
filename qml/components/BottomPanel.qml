import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Frame {
	/* for showing image name */
	property string imageFileName

	/* for showing image dimensions */
	property int imageWidth
	property int imageHeight

	/* for showing mouse position */
	property real mouseX: -1
	property real mouseY: -1

	Layout.fillWidth: true
	Layout.preferredHeight: 40

	RowLayout {
		anchors.fill: parent
		spacing: 20

		RowLayout {
			Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
			spacing: 10

			Label {
				text: "* load an image and run a detection model on it..."
			}
		}

		Item { Layout.fillWidth: true }

		RowLayout {
			Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

			Label {
				objectName: "fileNameLabelObject"
				text: "Name: " + (imageFileName ? imageFileName : "-")
			}

			Label {
				objectName: "imageSizeLabelObject"
				text: "Size: " + (imageWidth && imageHeight ? imageWidth + ", " + imageHeight : "-")
			}

			Label {
				objectName: "mousePositionLabelObject"
				text: mouseX >= 0 && mouseY >= 0 ? "Mouse: " + Math.round(mouseX) + ", " + Math.round(mouseY) :
					"Mouse: -"
			}
		}
	}
}
