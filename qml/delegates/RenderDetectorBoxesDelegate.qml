import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
// -------------------------------------------------------
// Input Properties
// -------------------------------------------------------
	// from CenterViewer to fix zoom and offset for boxes
	property var centerViewer

	// image position relative to the main viewer
	// tip: paintedWidth and paintedHeight are actual image height and width
	// they should scaled
	property var image_pos_x: (centerViewer.width - centerViewer.mainImage.paintedWidth * centerViewer.zoom)  / 2
	property var image_pos_y: (centerViewer.height - centerViewer.mainImage.paintedHeight * centerViewer.zoom) / 2

// -------------------------------------------------------
// Main
// -------------------------------------------------------
	anchors.fill: parent
	visible: model.check_box_visible

	Repeater {
		model: detector_boxes

		delegate: Rectangle {
			x: model.x * centerViewer.zoom + centerViewer.offsetX + image_pos_x
			y: model.y * centerViewer.zoom + centerViewer.offsetY + image_pos_y
			width: model.width * centerViewer.zoom
			height: model.height * centerViewer.zoom

			// no color for the rectangle
			color: "transparent"

			// box color
			border.color: Qt.rgba(
				model.red,
				model.green,
				model.blue,
				model.alpha / 255
			)

			border.width: 2

			Text {
				anchors.top: parent.top
				anchors.left: parent.left

				anchors.topMargin: 5
				anchors.leftMargin: 5

				color.r: model.red
				color.g: model.green
				color.b: model.blue

				text: model.label
			}

			Text {
				anchors.top: parent.top
				anchors.right: parent.right

				anchors.topMargin: 5
				anchors.rightMargin: 5

				color.r: model.red
				color.g: model.green
				color.b: model.blue

				text: Number(model.confidence).toFixed(2)
			}
		}
	}
}
