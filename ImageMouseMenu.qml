import QtQuick 2.0

Rectangle {
  id: root
  color: "#0E1621"
  radius: 20
  property int absoluteHeight: column.implicitHeight+40
  width: 200
  clip: true
  Column{
      id: column
      anchors.bottom: parent.bottom
      anchors.bottomMargin: 17
      anchors.top: parent.top
      anchors.topMargin: 20
      anchors.right: parent.right
      anchors.rightMargin: 0
      anchors.left: parent.left
      anchors.leftMargin: 0
      spacing: 10//fileDialog
      ImageMouseMenu_Delegate{
          title: "Открыть.."
          mArea.onClicked: {
              popup_MouseMenu.close()
              fileDialog.open()
          }
      }
      ImageMouseMenu_Delegate{
          title: "Сохранить как.."
          mArea.onClicked: {
              popup_MouseMenu.close()
              popup_Image_SaveAs.open()
          }
      }
      ImageMouseMenu_Delegate{
          title: "Удалить"
          mArea.onClicked: {
              popup_MouseMenu.close()
              fileInfo.removeFile(handleString.removeBegin(image.source,8))
              menuImage.listOtherPhoto.reloadList(fileInfo.getFilesDirectoty(image.source))
              menuImage.list_Property.reloadList(image.source)
          }
      }
      ImageMouseMenu_Delegate{
          title: "Повернуть"
          mArea.onClicked: {
              popup_MouseMenu.close()
              popup_imageRotation.open()
          }
      }
      ImageMouseMenu_Delegate{
          title: "Убрать масштаб"
          mArea.onClicked: {
              popup_MouseMenu.close()
              image.zoom = 0.0
          }
      }

  }
}


