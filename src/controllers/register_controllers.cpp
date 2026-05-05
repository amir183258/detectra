#include <QQmlEngine>

#include "controllers/register_controllers.hpp"
#include "controllers/object_detector_controller.hpp"
#include "controllers/detector_box_file_manager_controller.hpp"

void register_controllers() {
	qmlRegisterType<ObjectDetectorController>("BackendEngine", 1, 0,
			"ObjectDetectorController");

	qmlRegisterType<DetectorBoxFileManagerController>("BackendEngine", 1, 0,
			"DetectorBoxFileManagerController");
}
