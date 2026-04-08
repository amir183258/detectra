import QtQuick
import QtTest
import DetectorUI

TestCase {
	name: "BottomPanelTest"

	Component {
		id: bottomPanelComponent
		BottomPanel {}
	}

	QtObject {
		id: fakeViewer

		property string imageFileName: "cat.png"
		property int imageWidth: 640
		property int imageHeight: 480
	}

	function test_labelsUpdate() {
		var panel = createTemporaryObject(bottomPanelComponent, null)

		verify(panel !== null)

		panel.imageViewer = fakeViewer

		verify(labels.length >= 3)

		var nameLabel = findChild(panel, "fileNameLabelObject")
		var sizeLabel = findChild(panel, "imageSizeLabelObject")

		compare(nameLabel.text, "Name: cat.png")
		compare(sizeLabel.text, "Size: 640, 480")
	}

	function test_bindingUpdates() {
		var panel = createTemporaryObject(bottomPanelComponent, null)
		panel.imageViewer = fakeViewer
		
		var nameLabel = findChild(panel, "fileNameLabel")

		compare(nameLabel.text, "Name: cat.png")

		fakeViewer.imageFileName = "dog.png"

		comapre(nameLabel.text, "Name: dog.png")
	}
}
