#ifndef HANDLESTRING_H
#define HANDLESTRING_H
#include <QObject>
#include <QRegularExpression>

class HandleString : public QObject
{
    Q_OBJECT
public:
    //HandleString();
    Q_INVOKABLE QString removeEnd(QString input, int value);
    Q_INVOKABLE QString removeBegin(QString input, int value);
    Q_INVOKABLE QString removeChar(QString input, QString value);
    Q_INVOKABLE QString replace(QString input, QString valueDelete, QString valueReplace);
};

#endif // HANDLESTRING_H
