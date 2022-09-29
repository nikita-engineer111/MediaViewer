#include "handlestring.h"


QString HandleString::removeEnd(QString input, int value)
{
    int length = input.length();
    return input.remove(length - value, length);
}
QString HandleString::removeBegin(QString input, int value)
{
    return input.remove(0, value);
}
QString HandleString::removeChar(QString input, QString value)
{
    QRegularExpression rx(value);
    return input.remove(rx);
}
QString HandleString::replace(QString input, QString valueDelete, QString valueReplace)
{
    QRegularExpression rx(valueDelete);
    return input.replace(rx,valueReplace);
}
