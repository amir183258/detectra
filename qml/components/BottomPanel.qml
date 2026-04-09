import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Frame {
	/* for showing image name */
	property string imageFileName

	/* for showing image dimensions */
	property int imageWidth
	property int imageHeight

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
				text: "Name: " + (imageFileName ? imageFileName : "No Image")
			}

			Label {
				objectName: "imageSizeLabelObject"
				text: "Size: " + (imageWidth && imageHeight ? imageWidth + ", " + imageHeight : "No Image")
			}

			Label {
				objectName: "mousePositionLabelObject"
				text: "Mouse: test"
			}
		}
	}
}
