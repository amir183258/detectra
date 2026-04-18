 #include <QtQuickTest>
 #include <QQmlEngine>
 #include <QQmlContext>
 #include <QGuiApplication>

#include "controllers/register_controllers.hpp"

class Setup: public QObject {
	Q_OBJECT

public:
	Setup() {}

public slots:
	// load backend here
	void qmlEngineAvailable(QQmlEngine *engine) {
		register_controllers();
	}
};

QUICK_TEST_MAIN_WITH_SETUP(mytest, Setup)

#include "main.moc"
