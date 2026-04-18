#include <QQmlEngine>

#include "controllers/register_controllers.hpp"
#include "controllers/object_detector_controller.hpp"

void register_controllers() {
	qmlRegisterType<ObjectDetectorController>("BackendEngine", 1, 0,
			"ObjectDetectorController");
}
