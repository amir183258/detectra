import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Text {
	property int imageStatus
	property bool dragActive: false

	anchors.centerIn: parent

	color: "gray"
	text: {
		if (dragActive)
			return "Drop Here"

		if (imageStatus === Image.Loading)
			return "Loading Image..."

		if (imageStatus === Image.Error)
			return "Failed to Load Image"

		return "Open an Image"
	}

	visible: imageStatus != Image.Ready
}
