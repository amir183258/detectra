import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
// -------------------------------------------------------
// Input Properties
// -------------------------------------------------------
	property int imageStatus: Image.Null
	property bool dragActive: false

// -------------------------------------------------------
// Initialization
// -------------------------------------------------------
	anchors.centerIn: parent

// -------------------------------------------------------
// Main
// -------------------------------------------------------
	Text {
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
}
