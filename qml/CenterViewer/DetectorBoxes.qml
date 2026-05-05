import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
// -------------------------------------------------------
// Input Properties
// -------------------------------------------------------
	// from LeftPanel for rendering detector boxes
	property var detectorBoxesListModel
	property var centerViewer // this component needs to know about centerViewr

// -------------------------------------------------------
// Initialization
// -------------------------------------------------------
	id: detectorBoxesId
	anchors.fill: parent

// -------------------------------------------------------
// Main
// -------------------------------------------------------
	ListView {
		anchors.fill: parent
		// only render when image is ready
		visible: centerViewer.mainImage.status === Image.Ready

		model: detectorBoxesListModel
		delegate: RenderDetectorBoxesDelegate {
			// inputs
			centerViewer: detectorBoxesId.centerViewer
		}
	}
}
