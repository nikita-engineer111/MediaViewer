#ifndef MV_FILEINFO_H
#define MV_FILEINFO_H
#include <QFileInfo>
#include <QDebug>
#include <QFile>
#include <QDateTime>
#include <QDir>
#include <QDirIterator>
#include <QImage>

class MV_FileInfo : public QObject
{
    Q_OBJECT

public:
    //MV_FileInfo();
    Q_INVOKABLE QString getFileName(QString path);
    Q_INVOKABLE QString getFilePath(QString path);
    Q_INVOKABLE QString getFileSize(QString path);
    Q_INVOKABLE QString getFileDateCreated(QString path);
    Q_INVOKABLE QVariant getFilesDirectoty(QString path);
    Q_INVOKABLE void removeFile(QString path);
    Q_INVOKABLE void saveAsFile(QString imgPath,QString savePath,int resolution, int rotate);

private:

};

#endif // MV_FILEINFO_H
