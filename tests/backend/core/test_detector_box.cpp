#include <gtest/gtest.h>
#include <QRectF>
#include <QColor>

#include "core/detector_box.hpp"

TEST(DetectorBoxTest, DefaultConstructor) {
	DetectorBox box {};

	EXPECT_EQ(box.class_id, -1);

	EXPECT_EQ(box.confidence, 0);

	EXPECT_EQ(box.box_rect.x(), 0);
	EXPECT_EQ(box.box_rect.y(), 0);
	EXPECT_EQ(box.box_rect.height(), 0);
	EXPECT_EQ(box.box_rect.width(), 0);

	EXPECT_TRUE(box.box_description.isNull());

	EXPECT_EQ(box.color.red(), 0);
	EXPECT_EQ(box.color.green(), 0);
	EXPECT_EQ(box.color.blue(), 0);
	EXPECT_EQ(box.color.alpha(), 0);
}

TEST(DetectorBoxTest, PropertyAssignment) {
	DetectorBox box {};

	box.class_id = 5;
	box.label = "car";
	box.confidence = 0.85f;
	box.box_rect = QRectF(10, 20, 100, 200);
	box.box_description = "Detected car";
	box.color = QColor(Qt::red);

	EXPECT_EQ(box.class_id, 5);
	EXPECT_EQ(box.label, "car");
	EXPECT_FLOAT_EQ(box.confidence, 0.85f);

	EXPECT_EQ(box.box_rect.x(), 10);
	EXPECT_EQ(box.box_rect.y(), 20);
	EXPECT_EQ(box.box_rect.width(), 100);
	EXPECT_EQ(box.box_rect.height(), 200);

	EXPECT_EQ(box.box_description, "Detected car");
	EXPECT_EQ(box.color, QColor(Qt::red));
}

TEST(DetectorBoxTest, CopyAndAssignment) {
	DetectorBox a{};
	a.class_id = 2;
	a.label = "person";
	a.confidence = 0.9f;
	a.box_rect = QRectF(1, 1, 20, 40);
	a.color = QColor(Qt::blue);

	DetectorBox b = a;  // copy constructor

	EXPECT_EQ(b.class_id, a.class_id);
	EXPECT_EQ(b.label, a.label);
	EXPECT_FLOAT_EQ(b.confidence, a.confidence);
	EXPECT_EQ(b.box_rect, a.box_rect);
	EXPECT_EQ(b.color, a.color);

	DetectorBox c;
	c = a;  // assignment

	EXPECT_EQ(c.label, a.label);
	EXPECT_EQ(c.color, a.color);
}

TEST(DetectorBoxTest, DefaultColorIsTransparent) {
	DetectorBox box{};
	EXPECT_TRUE(box.color == QColor(Qt::transparent));
	EXPECT_EQ(box.color.alpha(), 0);
}

TEST(DetectorBoxTest, AggregateInitialization) {
	DetectorBox box{1, "dog", 0.8f, QRectF(0,0,50,50), "Animal", QColor(Qt::yellow)};

	EXPECT_EQ(box.class_id, 1);
	EXPECT_EQ(box.label, "dog");
	EXPECT_FLOAT_EQ(box.confidence, 0.8f);
	EXPECT_EQ(box.box_description, "Animal");
	EXPECT_EQ(box.color, QColor(Qt::yellow));
}
