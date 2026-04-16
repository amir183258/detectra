#include <gtest/gtest.h>
#include <QMetaType>
#include <QVariant>

#include "core/model_info.hpp"

TEST(ModelInfoTest, DefaultConstructor) {
	ModelInfo info {};

	EXPECT_TRUE(info.model_name.isNull());
	EXPECT_TRUE(info.format.isNull());
	EXPECT_TRUE(info.file_path.isNull());
	EXPECT_EQ(info.file_size, 0);
	EXPECT_EQ(info.input_width, 0);
	EXPECT_EQ(info.input_height, 0);
	EXPECT_EQ(info.num_classes, 0);
	EXPECT_TRUE(info.class_names.empty());
}

TEST(ModelInfoTest, PropertyAssignment) {
	ModelInfo info {};

	info.model_name = "test name";
	info.format = "test format";
	info.file_path = "test path";
	info.file_size = 64;
	info.input_width = 100;
	info.input_height = 200;
	info.num_classes = 3;
	info.class_names = {"first class", "second class", "third class"};

	EXPECT_EQ(info.model_name, "test name");
	EXPECT_EQ(info.format, "test format");
	EXPECT_EQ(info.file_path, "test path");
	EXPECT_EQ(info.file_size, 64);
	EXPECT_EQ(info.input_width, 100);
	EXPECT_EQ(info.input_height, 200);
	EXPECT_EQ(info.num_classes, 3);

	// class names
	EXPECT_EQ(info.class_names[0], "first class");
	EXPECT_EQ(info.class_names[1], "second class");
	EXPECT_EQ(info.class_names[2], "third class");
}

TEST(ModelInfoTest, MetatypeRegistration) {
	int typeId = qRegisterMetaType<ModelInfo>("ModelInfo");

	EXPECT_GT(typeId, 0);
	EXPECT_EQ(QMetaType::fromType<ModelInfo>().id(), typeId);
}

TEST(ModelInfoTest, QVariantConversion) {
	ModelInfo src;

	src.model_name = "model";
	src.format = "onnx";
	src.file_path = "./model.onnx";
	src.file_size = 123;
	src.input_width = 640;
	src.input_height = 480;
	src.num_classes = 2;
	src.class_names = {"person", "car"};

	QVariant v = QVariant::fromValue(src);

	EXPECT_TRUE(v.isValid());
	EXPECT_TRUE(v.canConvert<ModelInfo>());

	ModelInfo dst = v.value<ModelInfo>();

	EXPECT_EQ(dst.model_name, src.model_name);
	EXPECT_EQ(dst.format, src.format);
	EXPECT_EQ(dst.file_path, src.file_path);
	EXPECT_EQ(dst.file_size, src.file_size);
	EXPECT_EQ(dst.input_width, src.input_width);
	EXPECT_EQ(dst.input_height, src.input_height);
	EXPECT_EQ(dst.num_classes, src.num_classes);
	EXPECT_EQ(dst.class_names, src.class_names);
}

TEST(ModelInfoTest, QVariantMapConversion) {
	ModelInfo info;
	info.model_name = "test";

	QVariantMap map;
	map["info"] = QVariant::fromValue(info);

	EXPECT_TRUE(map["info"].canConvert<ModelInfo>());

	ModelInfo extracted = map["info"].value<ModelInfo>();

	EXPECT_EQ(extracted.model_name, "test");
}
