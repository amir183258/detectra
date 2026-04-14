#ifndef CORE_MODEL_INFO_HPP
#define CORE_MODEL_INFO_HPP

#include <QString>
#include <QStringList>

struct ModelInfo {
	QString model_name;
	QString format;
	QString file_path;
	long long file_size;
	int input_width;
	int input_height;
	int num_classes;
	QStringList class_names;

	/* default constructor */
	ModelInfo():
		file_size {0},
		input_width {0},
		input_height {0},
		num_classes {0}
	{
	}
};

#endif
