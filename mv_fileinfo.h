#ifndef MV_FILEINFO_H
#define MV_FILEINFO_H
#include <QFileInfo>
#include <QDebug>
#include <QFile>
#include <QDateTime>
#include <QDir>
#include <QDirIterator>

class MV_FileInfo : public QObject
{
    Q_OBJECT

public:
    //MV_FileInfo();
    Q_INVOKABLE QString getFileName(QString path);
    Q_INVOKABLE QString getFilePath(QString path);
    Q_INVOKABLE qint64 getFileSize(QString path);
    Q_INVOKABLE QString getFileDateCreated(QString path);
    Q_INVOKABLE QVariant getFilesDirectoty(QString path);

private:

};

#endif // MV_FILEINFO_H
