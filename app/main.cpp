#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>

#include "controllers/register_controllers.hpp"

int main(int argc, char *argv[]) {
	QGuiApplication app(argc, argv);

	// load the style
	QQuickStyle::setStyle("Universal");

	qputenv("QT_QUICK_CONTROLS_UNIVERSAL_THEME", "Dark");
	qputenv("QT_QUICK_CONTROLS_UNIVERSAL_ACCENT", "Blue");

	// register types
	register_controllers();

	QQmlApplicationEngine engine;

	engine.loadFromModule("DetectorUI", "MainWindow");

	if (engine.rootObjects().isEmpty())
		return -1;

	return app.exec();
}
