#ifndef MOCK_OBJECT_DETECTOR_HPP
#define MOCK_OBJECT_DETECTOR_HPP

#include <QString>
#include <QImage>
#include <QVector>

#include "core/object_detector.hpp"
#include "core/detector_box.hpp"
#include "core/model_info.hpp"

class MockObjectDetector: public ObjectDetector {
private:
	bool ready = false;
	ModelInfo info;


public:
	bool load_model(const QString &model_path) override {
		Q_UNUSED(model_path);

		/* fill ModelInfo structure */
		info.model_name = "Mock Detector";
		info.format = "Mock Format";
		info.file_path = model_path;
		info.file_size = 123456;
		info.input_width = 640;
		info.input_height = 640;
		info.num_classes = 2;
		info.class_names = {"person", "car"};

		ready = true;

		return true;
	}

	QVector<DetectorBox> run(const QImage &image) override {
		Q_UNUSED(image);

		QVector<DetectorBox> output;

		/* create 2 DetectorBoxes and push to the vector */
		DetectorBox a {};
		a.class_id = 0;
		a.label = "person";
		a.confidence = 0.95f;
		a.box_rect = QRectF(50, 50, 200, 400);
		a.color = QColor(Qt::yellow);

		DetectorBox b {};
		b.class_id = 1;
		b.label = "car";
		b.confidence = 0.88f;
		b.box_rect = QRectF(300, 200, 260, 160);
		b.color = QColor(Qt::cyan);

		output.push_back(a);
		output.push_back(b);

		return output;
	}

	bool is_ready() const {
		return ready;
	}

	ModelInfo model_info() const override {
		return info;
	}
};

#endif
