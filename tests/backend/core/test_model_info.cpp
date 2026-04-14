#include <gtest/gtest.h>



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

	/* class names */
	EXPECT_EQ(info.class_names[0], "first class");
	EXPECT_EQ(info.class_names[1], "second class");
	EXPECT_EQ(info.class_names[2], "third class");
}
