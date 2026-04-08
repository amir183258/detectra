import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Frame {
	property CenterViewer imageViewer

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
				text: "Name: " + (imageViewer ? imageViewer.imageFileName : "")
			}

			Label {
				objectName: "imageSizeLabelObject"
				text: "Size: " + (imageViewer ? imageViewer.imageWidth + ", " + imageViewer.imageHeight : "")
			}

			Label {
				objectName: "mousePositionLabelObject"
				text: "Mouse: test"
			}
		}
	}
}
