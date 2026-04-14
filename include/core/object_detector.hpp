#ifndef CORE_OBJECT_DETECTOR_HPP
#define CORE_OBJECT_DETECTOR_HPP

#include <QString>
#include <QImage>
#include <QVector>

#include "core/detector_box.hpp"
#include "core/model_info.hpp"

class ObjectDetector {
private:

public:
	/* virtual destructor is necessary */
	virtual ~ObjectDetector() = default;

	virtual bool load_model(const QString &model_path) = 0;

	virtual QVector<DetectorBox> run(const QImage &image) = 0;

	virtual bool is_ready() const = 0;

	virtual ModelInfo model_info() const = 0;

};

#endif
