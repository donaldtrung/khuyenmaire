import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.0

Component
{
    Item
    {
        anchors.fill: parent
        Rectangle
        {
            id: recInfo
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.right: parent.right
            height: parent.height * 0.75
            //width:
            color: palette.colorWhite
        }
        Rectangle
        {
            anchors.top: recInfo.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.topMargin: parent.height * 0.05

            //height: 1000
            color: palette.colorWhite
        }

        Button{
            id: btnLogout
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: parent.height * 0.02
            anchors.rightMargin: parent.height * 0.02
            //anchors.verticalCenter: parent.verticalCenter
            //anchors.ho: parent.ho
            text: string.log_out


            style: ButtonStyle {
                    background: Rectangle {
                        implicitWidth: 120 * app.dp
                        implicitHeight: 40 * app.dp
                        color: palette.black_20_transparent
                        //border.width: control.activeFocus ? 2 : 1
                        //border.color: "#888"
                        radius: 10
                        border.width: 1
                        /*
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                            GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                        }
                        */
                    }
                }
        }
        Image
        {
            id: imgProfile
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
           // anchors.left: parent.left
            //anchors.right: parent.right
           // anchors.fill: parent
            anchors.topMargin: parent.height * 0.15
            height: parent.height*0.3
            width: parent.height*0.3
            fillMode: Image.PreserveAspectCrop
            source: image
            smooth: true
            antialiasing: true
        }
        Button{
            id: btnTotal
            anchors.top: imgProfile.bottom
            anchors.left: parent.left
            anchors.topMargin: parent.height * 0.15
            anchors.leftMargin: parent.height * 0.4
            //anchors.verticalCenter: parent.verticalCenter
            //anchors.ho: parent.ho
            text:  string.total_points + ' <font color="#ff5400"><b>' + total + '</b></font>'

            style: ButtonStyle {
                    background: Rectangle {
                        implicitWidth: 120 * app.dp
                        implicitHeight: 40 * app.dp
                        color: palette.colorWhite
                        //border.width: control.activeFocus ? 2 : 1
                        //border.color: "#888"
                        radius: 10
                        border.width: 1
                        /*
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                            GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                        }
                        */
                    }
                }
        }
        Button{
            anchors.top: imgProfile.bottom
            anchors.left: btnTotal.right
            anchors.topMargin: parent.height * 0.15
            anchors.leftMargin: parent.height * 0.1
            //anchors.verticalCenter: parent.verticalCenter
            //anchors.ho: parent.ho
            text:  string.current_points + ' <font color="#ff5400"><b>' + points + 'đ</b></font>'

            style: ButtonStyle {
                    background: Rectangle {
                        implicitWidth: 120 * app.dp
                        implicitHeight: 40 * app.dp
                        color: palette.colorWhite
                        //border.width: control.activeFocus ? 2 : 1
                        //border.color: "#888"
                        radius: 10
                        border.width: 1
                        /*
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                            GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                        }
                        */
                    }
                }
        }
    }
}
