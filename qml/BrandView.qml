import QtQuick 2.0

import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.0
Rectangle{
    id: brandView
    width: parent.width
    height: parent.height
    x: 0
    y: 0
    Behavior on x { NumberAnimation { duration: app.durationOfMenuAnimation; easing.type: Easing.OutQuad } }

    color: palette.secondary
    Rectangle {
        id: brandView_menuBar
        z: 5
        anchors.top: parent.top
        anchors.topMargin: 0
        width: parent.width
        height: app.orientation == app.orientationLandscape ? 40*app.dp : 100*app.dp
        color: palette.colorWhite
        Rectangle {
            id: brandView_menuButton
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            width: 1.2*height
            height: parent.height
            scale: maMenuBar.pressed ? 1.2 : 1
            color: "transparent"
            Image {
                anchors.centerIn: parent
                height: parent.height * 0.5
                fillMode: Image.PreserveAspectFit
                source: "qrc:/images/ic_back_white_bg.png"
            }
            MouseArea {
                id: brandView_maMenuBar
                anchors.fill: parent
                onClicked: brandView_backToMenu()
            }
            clip: true
        }
        Label {
            id: brandView_titleText
            anchors.right: parent.right
            anchors.rightMargin: 0.2 * parent.height
            anchors.verticalCenter: parent.verticalCenter
            text: string.brand
            font.pixelSize: 0.4*parent.height
            font.bold: true
            color: palette.colorPrimary
        }
    }
    Image {
        anchors.top: brandView_menuBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 6*app.dp
        z: 4
        source: "qrc:/images/shadow_title.png"
    }
    ListView
    {
        id: listViewBrand
        anchors.top: brandView_menuBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        clip: true
        //model: modelBrand
        delegate: brandComponent
    }
    Component.onCompleted: {
           request(listViewBrand, "http://api.khuyenmai.re/api/v1/brand/?query=" + menuView.title)
       }

}
