#include <gtest/gtest.h>

#include <QVariant>
#include <QString>

#include "controllers/detector_box_file_manager_controller.hpp"

class DetectorBoxFileManagerControllerTest: public ::testing::Test {
protected:
	QVariantMap box_map_1;
	QVariantMap box_map_2;

	void SetUp() override {
		// box 1
		box_map_1["class_id"] = 1;
		box_map_1["label"] = "cat";
		box_map_1["confidence"] = 0.9f;

		box_map_1["x"] = 10;
		box_map_1["y"] = 20;
		box_map_1["width"] = 100;
		box_map_1["height"] = 150;

		box_map_1["red"] = 255;
		box_map_1["green"] = 0;
		box_map_1["blue"] = 0;
		box_map_1["alpha"] = 255;

		// box 2
		box_map_2["class_id"] = 2;
		box_map_2["label"] = "dog";
		box_map_2["confidence"] = 0.7f;

		box_map_2["x"] = 50;
		box_map_2["y"] = 60;
		box_map_2["width"] = 80;
		box_map_2["height"] = 120;

		box_map_2["red"] = 0;
		box_map_2["green"] = 255;
		box_map_2["blue"] = 0;
		box_map_2["alpha"] = 255;
	}
};

TEST_F(DetectorBoxFileManagerControllerTest, Initialization) {
	DetectorBoxFileManagerController manager_controller {};
}

TEST_F(DetectorBoxFileManagerControllerTest, SaveBoxesToFile) {
	QVariantList boxes {box_map_1, box_map_2};

	DetectorBoxFileManagerController manager_controller {};

	QString path = "./tests/backend/test_files/test_boxes.dbox";

	bool ok = manager_controller.saveBoxes(path, boxes);

	EXPECT_TRUE(ok);
}

TEST_F(DetectorBoxFileManagerControllerTest, LoadBoxesFromFile) {
	QVariantList boxes {box_map_1, box_map_2};

	DetectorBoxFileManagerController manager_controller {};

	QString path = "./tests/backend/test_files/test_boxes.dbox";

	ASSERT_TRUE(manager_controller.saveBoxes(path, boxes));

	QVariantList loaded = manager_controller.loadBoxes(path);

	ASSERT_EQ(loaded.size(), 2);

	// check values
	EXPECT_EQ(loaded[0].toMap()["class_id"], 1);
	EXPECT_EQ(loaded[0].toMap()["label"], "cat");
	EXPECT_EQ(loaded[0].toMap()["confidence"], 0.9f);
	
	EXPECT_EQ(loaded[0].toMap()["x"], 10);
	EXPECT_EQ(loaded[0].toMap()["y"], 20);
	EXPECT_EQ(loaded[0].toMap()["width"], 100);
	EXPECT_EQ(loaded[0].toMap()["height"], 150);

	EXPECT_EQ(loaded[0].toMap()["red"], 255);
	EXPECT_EQ(loaded[0].toMap()["green"], 0);
	EXPECT_EQ(loaded[0].toMap()["blue"], 0);
	EXPECT_EQ(loaded[0].toMap()["alpha"], 255);

	// box 2
	EXPECT_EQ(loaded[1].toMap()["class_id"], 2);
	EXPECT_EQ(loaded[1].toMap()["label"], "dog");
	EXPECT_EQ(loaded[1].toMap()["confidence"], 0.7f);
	
	EXPECT_EQ(loaded[1].toMap()["x"], 50);
	EXPECT_EQ(loaded[1].toMap()["y"], 60);
	EXPECT_EQ(loaded[1].toMap()["width"], 80);
	EXPECT_EQ(loaded[1].toMap()["height"], 120);

	EXPECT_EQ(loaded[1].toMap()["red"], 0);
	EXPECT_EQ(loaded[1].toMap()["green"], 255);
	EXPECT_EQ(loaded[1].toMap()["blue"], 0);
	EXPECT_EQ(loaded[1].toMap()["alpha"], 255);
}
