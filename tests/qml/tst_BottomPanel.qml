import QtQuick
import QtTest
import DetectorUI

TestCase {
	name: "BottomPanelTests"

	Component {
		id: bottomPanelComponent
		BottomPanel {}
	}

	function test_labelsUpdate() {
		var panel = createTemporaryObject(bottomPanelComponent, null)

		verify(panel !== null)

		/* these are mock properties */
		panel.imageFileName = "cat.png"
		panel.imageWidth = 640
		panel.imageHeight = 480

		var nameLabel = findChild(panel, "fileNameLabelObject")
		var sizeLabel = findChild(panel, "imageSizeLabelObject")

		compare(nameLabel.text, "Name: cat.png")
		compare(sizeLabel.text, "Size: 640, 480")
	}
}
