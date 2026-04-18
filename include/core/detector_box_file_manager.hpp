#ifndef CORE_DETECTOR_BOX_FILE_MANAGER_HPP
#define CORE_DETECTOR_BOX_FILE_MANAGER_HPP

#include <QString>
#include <QVector>

#include "core/detector_box.hpp"

class DetectorBoxFileManager {
private:

public:
	bool save_boxes_to_file(const QString &file_path, const QVector<DetectorBox> &boxes);

	QVector<DetectorBox> load_boxes_from_file(const QString &file_path);
};

#endif
