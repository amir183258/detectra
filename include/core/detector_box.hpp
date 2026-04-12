#ifndef CORE_DETECTOR_BOX_HPP
#define CORE_DETECTOR_BOX_HPP

#include <QRectF>
#include <QString>
#include <QColor>

struct DetectorBox {
	int class_id;
	QString label;
	float confidence;
	QRectF box_rect;
	QString box_description;
	QColor color;

	/* default constructor */
	DetectorBox():
		class_id {-1},
		confidence {0},
		box_rect {0, 0, 0, 0},
		color {Qt::transparent}
	{
	}

	/* a constructor to be filled */
	DetectorBox(int class_id,
			const QString &label,
			float confidence,
			const QRectF &rect,
			const QString &desc,
			const QColor &color):
		class_id {class_id},
		label {label},
		confidence {confidence},
		box_rect {rect},
		box_description {desc},
		color {color}
	{
	}
};

#endif
