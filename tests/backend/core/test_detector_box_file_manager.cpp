#include <gtest/gtest.h>
#include <QString>
#include <QRectF>
#include <QVector>

#include "core/detector_box_file_manager.hpp"
#include "core/detector_box.hpp"

class DetectorBoxFileManagerTest: public ::testing::Test {
protected:
	DetectorBox box1;
	DetectorBox box2;
	DetectorBoxFileManager manager;

	void SetUp() override {
		box1 = DetectorBox(
				1,
				"cat",
				0.9f,
				QRectF(10, 20, 100, 150),
				"first box",
				QColor(255, 0, 0, 255)
		);

		box2 = DetectorBox(
				2,
				"dog",
				0.7f,
				QRectF(50, 60, 80, 120),
				"second box",
				QColor(0, 255, 0, 255)
		);
	}
};

TEST_F(DetectorBoxFileManagerTest, SaveBoxesToFile) {
	QVector<DetectorBox> vec = {box1, box2};
	QString path = "./tests/backend/test_files/test_boxes.dbox";

	bool ok = manager.save_boxes_to_file(path, vec);
	EXPECT_TRUE(ok);
}

TEST_F(DetectorBoxFileManagerTest, LoadBoxesFromFile) {
	QVector<DetectorBox> vec = {box1, box2};
	QString path = "./tests/backend/test_files/test_boxes.dbox";

	ASSERT_TRUE(manager.save_boxes_to_file(path, vec));

	QVector<DetectorBox> loaded = manager.load_boxes_from_file(path);
	ASSERT_EQ(loaded.size(), 2);

	EXPECT_EQ(loaded[0].class_id, box1.class_id);
	EXPECT_EQ(loaded[0].label, box1.label);
	EXPECT_FLOAT_EQ(loaded[0].confidence, box1.confidence);
	EXPECT_EQ(loaded[0].box_rect, box1.box_rect);
	EXPECT_EQ(loaded[0].box_description, box1.box_description);
	EXPECT_EQ(loaded[0].color, box1.color);

	EXPECT_EQ(loaded[1].class_id, box2.class_id);
	EXPECT_EQ(loaded[1].label, box2.label);
	EXPECT_FLOAT_EQ(loaded[1].confidence, box2.confidence);
	EXPECT_EQ(loaded[1].box_rect, box2.box_rect);
	EXPECT_EQ(loaded[1].box_description, box2.box_description);
	EXPECT_EQ(loaded[1].color, box2.color);
}
