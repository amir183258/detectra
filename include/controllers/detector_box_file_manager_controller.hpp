#ifndef CONTROLLERS_DETECTOR_BOX_FILE_MANAGER_CONTROLLER_HPP
#define CONTROLLERS_DETECTOR_BOX_FILE_MANAGER_CONTROLLER_HPP

#include <memory>

#include <QObject>
#include <QString>
#include <QVariantList>

#include "core/detector_box_file_manager.hpp"

class DetectorBoxFileManagerController: public QObject {
	Q_OBJECT
private:
	std::unique_ptr<DetectorBoxFileManager> file_manager;

public:
	explicit DetectorBoxFileManagerController(QObject *parent = nullptr);

	Q_INVOKABLE bool saveBoxes(const QString &file_path, const QVariantList &boxes);

	Q_INVOKABLE QVariantList loadBoxes(const QString &file_path);
};

#endif
