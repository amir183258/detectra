import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

MenuBar {
	property var imageActions
	property var detectionActions

	signal resetViewRequested()

	Menu {
		title: "File"

		MenuItem {
			action: imageActions.openImageAction
		}

		MenuItem {
			text: "Save Bounding Boxes"
		}

		MenuSeparator {}

		MenuItem { text: "Exit"; onTriggered: Qt.quit() }
	}

	Menu {
		title: "Edit"

		MenuItem {
			action: imageActions.resetViewAction
		}
	}

	// load a detection model
	Menu {
		title: "Tools"

		MenuItem {
			action: detectionActions.loadDetectorModelAction
		}
	}
}
