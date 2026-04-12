import QtQuick
import QtTest
import DetectorUI

TestCase {
	name: "PlaceholderTextTests"

	Window {
		id: root
		width: 300
		height: 200

		PlaceholderText {
			id: placeholderTextId
		}
	}

	/* text property */
	function test_drag_text() {
		placeholderTextId.dragActive = true
		compare(placeholderTextId.text, "Drop Here")
	}
	
	function test_loading_text() {
		placeholderTextId.dragActive = false
		placeholderTextId.imageStatus = Image.Loading
		compare(placeholderTextId.text, "Loading Image...")
	}

	function test_default_text() {
		placeholderTextId.dragActive = false
		placeholderTextId.imageStatus = Image.Null
		compare(placeholderTextId.text, "Open an Image")
	}

	/* visibility */
	function test_visibility_ready() {
		placeholderTextId.imageStatus = Image.Ready
		compare(placeholderTextId.visible, false)
	}

	function test_visibility_loading() {
		placeholderTextId.imageStatus = Image.Loading
		compare(placeholderTextId.visible, true)
	}

	function test_visibility_error() {
		placeholderTextId.imageStatus = Image.Error
		compare(placeholderTextId.visible, true)
	}

	/* dragActive priority test */
	function test_drag_overrides_all() {
		placeholderTextId.imageStatus = Image.Error
		placeholderTextId.dragActive = true
		compare(placeholderTextId.text, "Drop Here")
	}
}
