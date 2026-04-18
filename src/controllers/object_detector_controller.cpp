#include <memory>

#include <QVariant>
#include <QObject>
#include <QString>
#include <QImage>
#include <QVector>

#include "controllers/object_detector_controller.hpp"
#include "core/object_detector.hpp"
#include "core/detector_box.hpp"
#include "core/model_info.hpp"

// TODO this is mock
#include "mock_object_detector.hpp"

ObjectDetectorController::ObjectDetectorController(QObject *parent, std::unique_ptr<ObjectDetector> d):
	QObject {parent},
	detector {std::move(d)}
{
	// TODO this is mock and should be changed
	detector = std::make_unique<MockObjectDetector>();
}

bool ObjectDetectorController::loadModel(const QString &path) {
	bool model_loaded = detector->load_model(path);
	
	if (model_loaded) {
		emit modelInfoChanged();
		return true;
	}
	return false;
}

bool ObjectDetectorController::isReady() const {
	if (!detector)
		return false;

	return detector->is_ready();
}

QVariantList ObjectDetectorController::runOnImage(const QImage &img) {
	QVariantList out;

	QVector<DetectorBox> boxes = detector->run(img);
	for (const DetectorBox &b: boxes) {
		QVariantMap m;
		m["classId"] = b.class_id;
		m["label"] = b.label;
		m["confidence"] = b.confidence;
		m["x"] = b.box_rect.x();
		m["y"] = b.box_rect.y();
		m["w"] = b.box_rect.width();
		m["h"] = b.box_rect.height();
		m["color"] = b.color.name();

		out.push_back(m);
	}

	return out;
}

QVariantMap ObjectDetectorController::getModelInfo() const {
	QVariantMap out;

	ModelInfo info = detector->model_info();

	out["modelName"] = info.model_name;
	out["format"] = info.format;
	out["filePath"] = info.file_path;
	out["fileSize"] = info.file_size;
	out["inputWidth"] = info.input_width;
	out["inputHeight"] = info.input_height;
	out["numClasses"] = info.num_classes;
	out["classNames"] = info.class_names;

	return out;
}
