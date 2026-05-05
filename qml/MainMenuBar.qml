import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

MenuBar {
// -------------------------------------------------------
// Input Actions
// -------------------------------------------------------
	// from main actions
	property var imageActions
	property var detectionActions
	property var boxManagerActions

	// TODO delete this
	signal resetViewRequested()

// -------------------------------------------------------
// Main Menu
// -------------------------------------------------------
	// file menu: operations related to file
	Menu {
		title: "File"

		MenuItem {
			action: imageActions.openImageAction
		}

		MenuItem {
			action: boxManagerActions.loadDetectorBoxesAction
		}

		MenuSeparator {}

		// exit the app
		MenuItem {
			text: "Exit"; onTriggered: Qt.quit()
		}
	}
	
	//
	//
	//

	// edit menu: operations related to editing such as zoom
	Menu {
		title: "Edit"

		MenuItem {
			action: imageActions.resetViewAction
		}
	}

	//
	//
	//

	// tools menu: operations related to the backend
	Menu {
		title: "Tools"

		MenuItem {
			action: detectionActions.loadDetectorModelAction
		}

		MenuItem {
			action: detectionActions.applyDetectorModelAction
		}
	}
}
