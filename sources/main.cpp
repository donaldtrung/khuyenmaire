#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlDriver>
#include <QDebug>
#include <QtScript/QScriptEngine>
//local.dieuviet.com
//khuyenmaire/KMR@123

#include "mydevice.h"
//bool createConnection();
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    qmlRegisterType<MyDevice>("mydevice", 1, 0, "MyDevice");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

  //  QNetworkAccessManager networkManager;
/*
    QUrl url("http://api.khuyenmai.re/api/v1/deal");
    QNetworkRequest request;
    request.setUrl(url);

    request.setRawHeader("token", "1");
    QNetworkReply* currentReply = networkManager.get(request);
    QString data = (QString) currentReply->readAll();

    //QJsonDocument json = QJsonDocument::fromJson(data);
printf("s");
*/
    //qDebug(json);

    return app.exec();

}


