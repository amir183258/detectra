import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

Frame {
	property alias imageSource: imageViewerId.source
	property alias imageWidth: imageViewerId.sourceSize.width
	property alias imageHeight: imageViewerId.sourceSize.height
	property alias imageStatus: imageViewerId.status

	property string imageFileName: {
		if (imageViewerId.status !== Image.Ready)
			return "No Image"

		var path = imageSource.toString()
		return path.split("/").pop()
	}

	/* signal for mouse position and movement */
	signal mouseMoved(real x, real y)

	Layout.fillWidth: true
	Layout.fillHeight: true

	clip: true

	/* image component for showing image */
	property real zoom: 1.0

	property real offsetX: 0
	property real offsetY: 0

	property real startX: 0
	property real startY: 0

	function resetView() {
		zoom = 1.0

		offsetX = 0
		offsetY = 0

		startX = 0
		startY = 0
	}

	/* this function takes coordinates of screen and converts them to
	 * the loaded image coordinate system. */
	function screenToImage(x, y) {
		if (imageViewerId.status !== Image.Ready)
			return null

		/* these are actual image width and height */
		let actualImageWidth = imageViewerId.paintedWidth
		let actualImageHeight = imageViewerId.paintedHeight

		/* these are image width and height after applying zoom */
		let scaledWidth = actualImageWidth * zoom
		let scaledHeight = actualImageHeight * zoom

		/* the origin is top left corner of image */
		let x0 = (mouseAreaId.width - scaledWidth) / 2
		let y0 = (mouseAreaId.height - scaledHeight) / 2

		/* final image coordinages */
		let imgX = (x - x0 - offsetX) / zoom
		let imgY = (y - y0 - offsetY) / zoom

		return {x: imgX, y: imgY }
	}

	Image {
		id: imageViewerId
		anchors.fill: parent
		fillMode: Image.Pad

		transform: [
			Scale {
				origin.x: imageViewerId.width / 2
				origin.y: imageViewerId.height / 2
				xScale: zoom
				yScale: zoom
			},
			Translate {
				x: offsetX
				y: offsetY
			}
		]
	}

	MouseArea {
		id: mouseAreaId
		anchors.fill: parent
		hoverEnabled: true
		propagateComposedEvents: true

		cursorShape: {
			if (imageViewerId.status === Image.Ready && panHandlerId.active)
				return Qt.ClosedHandCursor

			return Qt.ArrowCursor
		}

		onPositionChanged: function(mouse) {
			let p = screenToImage(mouse.x, mouse.y)
			if (!p)
				return

			/* these are actual image width and height */
			let actualImageWidth = imageViewerId.paintedWidth
			let actualImageHeight = imageViewerId.paintedHeight
			if (p.x < 0 || p.y < 0 || p.x > actualImageWidth || p.y > actualImageHeight)
				return

			mouseMoved(p.x, p.y)
		}
	}

	WheelHandler {
		onWheel: function(event) {

			if (event.angleDelta.y > 0)
				zoom *= 1.1
			else
				zoom /= 1.1

			zoom = Math.max(0.2, Math.min(5, zoom))
		}
	}

	DragHandler {
		id: panHandlerId
		acceptedButtons: Qt.MiddleButton
		target: null

		onActiveChanged: {
			if (active) {
				startX = offsetX
				startY = offsetY
			}
		}

		onTranslationChanged: {
			offsetX = startX + translation.x
			offsetY = startY + translation.y
		}
	}

	/* place holder text */
	PlaceholderText {
		imageStatus: imageViewerId.status
		dragActive: imageDropAreaId.dragActive
	}

	/* image drop area */
	ImageDropArea {
		id: imageDropAreaId
		anchors.fill: parent

		onImageDropped: function(url) {
			imageViewerId.source = url
			offsetX = 0
			offsetY = 0
			zoom = 1.0
		}
	}
}
