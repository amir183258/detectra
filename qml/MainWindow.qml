import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import DetectorUI.components

ApplicationWindow {
	id: rootId

	title: "Detector"

	/* window size */
	width: 1280
	height: 720

	visibility: Window.Maximized
	visible: true

	/* set font size */
	font.pointSize: 11

	/* set position center */
	Component.onCompleted: {
		x = (screen.width - width) / 2
		y = (screen.height - height) / 2
	}

	/* image actions */
	ImageActions {
		id: imageActionsId
		imageViewer: centerViewerId
	}

	menuBar: MainMenuBar {
		imageActions: imageActionsId
	}

	header: MainToolBar {
		imageActions: imageActionsId
	}

	ColumnLayout {
		anchors.fill: parent

		RowLayout {
			Layout.fillWidth: true
			Layout.fillHeight: true

			LeftPanel {}
			CenterViewer {
				id: centerViewerId
			}
			RightPanel {}
		}

		BottomPanel {
			imageViewer: centerViewerId
		}
	}
}
