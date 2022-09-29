import QtQuick 2.0

Rectangle {
  id: root
  color: "#0E1621"
  width: 170
  height: 300
  radius: 20
  Column{
      anchors.top: parent.top
      anchors.topMargin: 20
      anchors.horizontalCenter: parent.horizontalCenter
      spacing: 10
      MV_Text{
          text: "Сохранить как.."
      }
      MV_Text{
          text: "Удалить"
      }
  }
}
