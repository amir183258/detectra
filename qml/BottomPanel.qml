import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
// -------------------------------------------------------
// Input Properties
// -------------------------------------------------------
	property var centerViewer

// -------------------------------------------------------
// Initialization
// -------------------------------------------------------
	Layout.fillWidth: true
	Layout.preferredHeight: 40

	// these variables is for ease of use
	property var image_name: centerViewer.imageFileName
	property var image_width: centerViewer.mainImage.sourceSize.width
	property var image_height: centerViewer.mainImage.sourceSize.height
	property var image_mouse_pos_x: centerViewer.mouse_pos_on_image_x
	property var image_mouse_pos_y: centerViewer.mouse_pos_on_image_y

// -------------------------------------------------------
// Main
// -------------------------------------------------------
	Frame {
		anchors.fill: parent

		RowLayout {
			anchors.fill: parent
			spacing: 20

			RowLayout {
				Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
				spacing: 10

				// TODO log user activity here
				Label {
					text: "* load an image and run a detection model on it..."
				}
			}

			Item { Layout.fillWidth: true }

			RowLayout {
				Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

				Label {
					objectName: "fileNameLabelObject"
					text: "Name: " + (image_name ? image_name : "-")
				}

				Label {
					objectName: "imageSizeLabelObject"
					text: "Size: " + (image_width && image_height ? image_width + ", " + image_height : "-")
				}

				Label {
					objectName: "mousePositionLabelObject"
					text: image_mouse_pos_x>= 0 && image_mouse_pos_y >= 0 ?
						"Mouse: " + Math.round(image_mouse_pos_x) +
						", " + Math.round(image_mouse_pos_y) : "Mouse: -"
				}
			}
		}
	}
}
