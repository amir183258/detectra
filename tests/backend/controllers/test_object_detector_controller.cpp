#include <memory>

#include <gtest/gtest.h>

#include <QVariant>
#include <QString>
#include <QImage>

#include "controllers/object_detector_controller.hpp"
#include "mock_object_detector.hpp"

TEST(ObjectDetectorControllerTest, LoadModel) {
	std::unique_ptr<ObjectDetector> detector = 
		std::make_unique<MockObjectDetector>();

	ObjectDetectorController controller {nullptr, std::move(detector)};

	EXPECT_FALSE(controller.isReady());

	bool ok = controller.loadModel("dummpy/path/model.onnx");
	EXPECT_TRUE(ok);

	EXPECT_TRUE(controller.isReady());
}

TEST(ObjectDetectorControllerTest, RunReturnBoxes) {
	std::unique_ptr<ObjectDetector> detector = 
		std::make_unique<MockObjectDetector>();

	ObjectDetectorController controller {nullptr, std::move(detector)};

	// first load a model
	controller.loadModel("dummy");

	// now run model on an image
	QString fake_path = "";

	QVariantList results = controller.runOnImage(fake_path);

	// there are 2 boxes in mock
	ASSERT_EQ(results.size(), 2);

	QVariantMap out_map = results[0].toMap();

	EXPECT_EQ(out_map["class_id"].toInt(), 0);
	EXPECT_EQ(out_map["label"].toString(), "person");
	EXPECT_EQ(out_map["confidence"].toFloat(), 0.95f);

	EXPECT_EQ(out_map["x"].toInt(), 50);
	EXPECT_EQ(out_map["y"].toInt(), 50);
	EXPECT_EQ(out_map["width"].toInt(), 200);
	EXPECT_EQ(out_map["height"].toInt(), 400);

	EXPECT_EQ(out_map["red"], 255);
	EXPECT_EQ(out_map["green"], 255);
	EXPECT_EQ(out_map["blue"], 0);
	EXPECT_EQ(out_map["alpha"], 255);
}

TEST(ObjectDetectorControllerTest, ModelInformation) {
	std::unique_ptr<ObjectDetector> detector = 
		std::make_unique<MockObjectDetector>();

	ObjectDetectorController controller {nullptr, std::move(detector)};

	// first load a model
	controller.loadModel("dummy");

	QVariantMap info = controller.getModelInfo();

	EXPECT_EQ(info["modelName"].toString(), "Mock Detector");
	EXPECT_EQ(info["format"].toString(), "Mock Format");
	EXPECT_EQ(info["filePath"].toString(), "dummy");
	EXPECT_EQ(info["fileSize"].toInt(), 123456);
	EXPECT_EQ(info["inputWidth"].toInt(), 640);
	EXPECT_EQ(info["inputHeight"].toInt(), 640);
	EXPECT_EQ(info["numClasses"].toInt(), 2);

	QVariantList class_names = info["classNames"].toList();
	EXPECT_EQ(class_names.at(0).toString(), "person");
	EXPECT_EQ(class_names.at(1).toString(), "car");
}
