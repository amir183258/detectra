import QtQuick
import QtTest
import DetectorUI

TestCase {
	name: "imageDropAreaTests"

	Component {
		id: testComp
		ImageDropArea {
			id: testItem
			width: 300
			height: 200
		}
	}

	property var item

	function init() {
		item = createTemporaryObject(testComp, null)
		verify(item != null)
	}

	function test_initial_state() {
		compare(typeof item.dragActive, "boolean")
		compare(item.dragActive, false)

		verify(item.dropArea !== null)
		verify(item.errorDialog !== null)
	}

	function test_isImageFile() {
		verify(item.isImageFile("test.png"))
		verify(item.isImageFile("test.jpg"))
		verify(item.isImageFile("test.gif"))
		verify(item.isImageFile("test.jpeg"))
		verify(!item.isImageFile("text.txt"))
		verify(!item.isImageFile("foo"))
		verify(!item.isImageFile("png.fake"))
	}
}
