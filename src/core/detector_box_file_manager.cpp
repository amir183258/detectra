#include <QString>
#include <QVector>
#include <QRectF>
#include <QColor>
#include <QFile>
#include <QDataStream>

#include "core/detector_box_file_manager.hpp"
#include "core/detector_box.hpp"

bool DetectorBoxFileManager::save_boxes_to_file(const QString &file_path,
		const QVector<DetectorBox> &boxes) {
	QFile file(file_path);
	if (!file.open(QIODevice::WriteOnly))
		return false;

	QDataStream out(&file);
	out.setVersion(QDataStream::Qt_6_5); // a stable version for compatibility
	
	// header
	out.writeRawData("DBOX", 4);	// magic bytes
	out << quint16(1);		// version
	out << quint16(0);		// reserved
	
	// number of boxes
	out << quint32(boxes.size());

	// boxes
	for (const DetectorBox &b: boxes) {
		out << qint32(b.class_id);

		out << b.label;

		// box
		out << float(b.confidence);
		out << float(b.box_rect.x());
		out << float(b.box_rect.y());
		out << float(b.box_rect.width());
		out << float(b.box_rect.height());

		out << b.box_description;

		// color RGBA
		out << quint8(b.color.red());
		out << quint8(b.color.green());
		out << quint8(b.color.blue());
		out << quint8(b.color.alpha());
	}

	return true;
}

QVector<DetectorBox> DetectorBoxFileManager::load_boxes_from_file(const QString &file_path) {
	QVector<DetectorBox> boxes;

	QFile file(file_path);
	if (!file.open(QIODevice::ReadOnly))
		return boxes; // file read error; returns empty

	QDataStream in(&file);
	in.setVersion(QDataStream::Qt_6_5); // a stable version for compatibility

	// read header
	char magic[4];
	if (in.readRawData(magic, 4) != 4 || strncmp(magic, "DBOX", 4) != 0)
		return boxes; // file is not valid; return empty
	
	quint16 version;
	quint16 reserved;
	in>> version >> reserved;

	if (version != 1)
		return boxes; // invalid version; return empty

	// count
	quint32 count = 0;
	in >> count;

	boxes.reserve(count);

	// read boxes
	for (quint32 i = 0; i < count; ++i) {
		DetectorBox b;

		qint32 cid;

		in >> cid;
		b.class_id = cid;

		in >> b.label;

		float conf;
		in >> conf;
		b.confidence = conf;

		float x, y, w, h;
		in >> x >> y >> w >> h;
		b.box_rect = QRectF(x, y, w, h);

		in >> b.box_description;

		quint8 r, g, bl, a;
		in >> r >> g >> bl >> a;
		b.color = QColor(r, g, bl, a);

		boxes.append(b);
	}

	return boxes;
}
