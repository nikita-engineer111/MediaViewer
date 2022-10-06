#include "mv_fileinfo.h"
#include "QMatrix"
#include "QPoint"

QString MV_FileInfo::getFileName(QString path)
{
    QFileInfo fileInfo(path);
    return fileInfo.fileName();
}
QString MV_FileInfo::getFilePath(QString path)
{
    QFileInfo fileInfo(path);
    return fileInfo.filePath();
}
QString MV_FileInfo::getFileSize(QString path)
{
    //doesnt work. return 0
    QFileInfo fileInfo(path);
    fileInfo.setFile(path);
    //qDebug() << path << fileInfo.size();
    return QString::number(fileInfo.size());
}
QString MV_FileInfo::getFileDateCreated(QString path)
{
    //doesnt work. return QDateTime(Invalid)
    QFileInfo fileInfo(path);
    QDateTime dateTime = fileInfo.birthTime();
    QString date = dateTime.date().toString();
    //qDebug() << path << date << fileInfo.birthTime();
    return date;
}
QVariant MV_FileInfo::getFilesDirectoty(QString path)
{
    QString pathTemp = path.remove(0,8);
    QFileInfo info(path);
    pathTemp = pathTemp.remove( info.fileName());
    QDir dir(pathTemp);
    QStringList filters;
    filters << "*.png" << "*.jpg" << "*.bmp" << ".svg";
    QFileInfoList fileInfoList = dir.entryInfoList(filters, QDir::Files|QDir::NoDotAndDotDot);

    QList<QStringList> list;
    for(int i = 0;i<fileInfoList.length();i++)
    {
        std::string name = fileInfoList[i].fileName().toStdString();
        std::string path = fileInfoList[i].filePath().toStdString();
        list << QStringList({QString::fromUtf8(name.c_str()),QString::fromUtf8(path.c_str())});
    }

    return QVariant::fromValue(list);
}
void MV_FileInfo::removeFile(QString path)
{
    QDir().remove(path);
}
void MV_FileInfo::saveAsFile(QString imgPath,QString savePath,int resolution, int rotate)
{
    QImage img(imgPath);
    QImage rotated_image = img.transformed(QTransform().rotate(rotate));
    rotated_image.save(savePath, "jpg", resolution);
    qDebug() << imgPath << resolution ;
}
