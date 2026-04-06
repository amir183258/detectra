#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>

int main(int argc, char *argv[]) {
	QGuiApplication app(argc, argv);

	/* load the style */
	QQuickStyle::setStyle("Universal");

	qputenv("QT_QUICK_CONTROLS_UNIVERSAL_THEME", "Dark");
	qputenv("QT_QUICK_CONTROLS_UNIVERSAL_ACCENT", "Blue");

	QQmlApplicationEngine engine;

	engine.loadFromModule("DetectorUI", "MainWindow");

	if (engine.rootObjects().isEmpty())
		return -1;

	return app.exec();
}
