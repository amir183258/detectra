#ifndef	CONTROLERS_OBJECT_DETECTOR_CONTROLLER_HPP
#define CONTROLERS_OBJECT_DETECTOR_CONTROLLER_HPP

#include <memory>

#include <QVariant>
#include <QObject>
#include <QString>
#include <QImage>

#include "core/object_detector.hpp"

class ObjectDetectorController: public QObject {
	Q_OBJECT

	Q_PROPERTY(QVariantMap modelInfo READ getModelInfo NOTIFY modelInfoChanged)
private:
	std::unique_ptr<ObjectDetector> detector;

public:
	explicit ObjectDetectorController(QObject *parent = nullptr, std::unique_ptr<ObjectDetector> d = nullptr);

	Q_INVOKABLE bool loadModel(const QString &path);

	Q_INVOKABLE bool isReady() const;
	
	Q_INVOKABLE QVariantList runOnImage(const QImage &img);

	QVariantMap getModelInfo() const;

signals:
	void modelInfoChanged();

};

#endif
