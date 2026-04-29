#include <QObject>
#include <QString>
#include <QVariant>
#include <QVector>

#include "controllers/detector_box_file_manager_controller.hpp"
#include "core/detector_box_file_manager.hpp"
#include "core/detector_box.hpp"

DetectorBoxFileManagerController::DetectorBoxFileManagerController(QObject *parent):
	QObject(parent)
{
	file_manager = std::make_unique<DetectorBoxFileManager>();
}

// qml should make a qvariantlist of qvariantmaps, we have to turn them to detector boxes
bool DetectorBoxFileManagerController::saveBoxes(const QString &file_path, const QVariantList &boxes) {
	QVector<DetectorBox> output_boxes;

	for (const QVariant &var: boxes) {
		QVariantMap map = var.toMap();

		DetectorBox box;

		// fill detector box
		box.class_id = map["class_id"].toInt();
		box.label = map["label"].toString();
		box.confidence = map["confidence"].toDouble();

		// box rectangle
		box.box_rect.setX(map["x"].toDouble());
		box.box_rect.setY(map["y"].toDouble());
		box.box_rect.setWidth(map["width"].toDouble());
		box.box_rect.setHeight(map["height"].toDouble());

		box.box_description = map["box_description"].toString();

		// color is rgba
		box.color.setRed(map["red"].toInt());
		box.color.setGreen(map["green"].toInt());
		box.color.setBlue(map["blue"].toInt());
		box.color.setAlpha(map["alpha"].toInt());

		output_boxes.append(box);
	}

	return file_manager->save_boxes_to_file(file_path, output_boxes);
}

QVariantList DetectorBoxFileManagerController::loadBoxes(const QString &file_path) {
	QVector<DetectorBox> boxes = file_manager->load_boxes_from_file(file_path);

	QVariantList list;
	for (const DetectorBox &box: boxes) {
		QVariantMap map;

		// fill map
		map["class_id"] = box.class_id;
		map["label"] = box.label;
		map["confidence"] = box.confidence;

		// box rectangle
		map["x"] = box.box_rect.x();
		map["y"] = box.box_rect.y();
		map["width"] = box.box_rect.width();
		map["height"] = box.box_rect.height();

		// color is rgba
		map["red"] = box.color.red();
		map["green"] = box.color.green();
		map["blue"] = box.color.blue();
		map["alpha"] = box.color.alpha();

		list.append(map);
	}

	return list;
}
