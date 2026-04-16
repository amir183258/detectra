#include <memory>

#include <gtest/gtest.h>
#include <QImage>
#include <QVector>
#include <QRectF>

#include "core/object_detector.hpp"
#include "core/model_info.hpp"

// include mock class
#include "mock_object_detector.hpp"

TEST(ObjectDetectorTest, LoadModel) {
	std::unique_ptr<ObjectDetector> detector = 
		std::make_unique<MockObjectDetector>();

	EXPECT_FALSE(detector->is_ready());

	bool ok = detector->load_model("dummy/path/model.onnx");
	EXPECT_TRUE(ok);
	EXPECT_TRUE(detector->is_ready());
}

TEST(ObjectDetectorTest, RunReturnBoxes) {
	std::unique_ptr<ObjectDetector> detector = 
		std::make_unique<MockObjectDetector>();

	// first load a model
	detector->load_model("dummy");

	// now run model on an image
	QImage fake_image(640, 480, QImage::Format_RGB888);

	QVector<DetectorBox> results = detector->run(fake_image);

	ASSERT_FALSE(results.isEmpty());
	ASSERT_EQ(results.size(), 2); // there are 2 boxes in mock class

	const DetectorBox &box = results[0];

	EXPECT_EQ(box.class_id, 0);
	EXPECT_EQ(box.label, "person");
	EXPECT_EQ(box.confidence, 0.95f);

	EXPECT_EQ(box.box_rect, QRectF(50, 50, 200, 400));
}

TEST(ObjectDetectorTest, ModelInformation) {
	std::unique_ptr<ObjectDetector> detector = 
		std::make_unique<MockObjectDetector>();

	detector->load_model("dummy");

	ModelInfo info = detector->model_info();

	EXPECT_EQ(info.model_name, "Mock Detector");
	EXPECT_EQ(info.format, "Mock Format");
	EXPECT_EQ(info.file_path, "dummy");
	EXPECT_EQ(info.file_size, 123456);
	EXPECT_EQ(info.input_width, 640);
	EXPECT_EQ(info.input_height, 640);
	EXPECT_EQ(info.num_classes, 2);

	EXPECT_EQ(info.class_names[0], "person");
	EXPECT_EQ(info.class_names[1], "car");
}
