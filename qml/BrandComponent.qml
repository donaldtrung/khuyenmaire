import QtQuick 2.0
import QtQuick.Controls 1.2
//import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4
Component
{
    Item
    {
        anchors.right: parent.right
        anchors.left: parent.left
        height: parent.width * 0.3
        width: parent.width
        Rectangle
        {
            id: brandDetail
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: parent.height * 1.5
            //color: palette.colorPrimary

            Image
            {
                id: imgBrandLogo
                //anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.1
                height: parent.height*0.3
                width: parent.width
                fillMode: Image.PreserveAspectFit
                source: app.prefixLogo(modelData.logo)
                //source: "http://storage.googleapis.com/jamja-prod/gcs_full_588089a076ec571d7df88025-2017-01-19-094049.png"
                smooth: true
                antialiasing: true
            }

            Text
            {
                id: textBrand
                anchors.top: imgBrandLogo.bottom
                anchors.topMargin: parent.height * 0.05
                //anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

                text: modelData.brand_name

                font.pixelSize: parent.height*0.1
                color: palette.colorPrimary
            }

            Button
            {
                anchors.top: textBrand.bottom
                anchors.topMargin: parent.height * 0.01
                //anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                //color: third
                //radius: 8
                Image
                {
                    anchors.left: parent.left
                    anchors.leftMargin: parent.height * 0.3
                    height: parent.height*0.5
                    fillMode: Image.PreserveAspectFit
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/images/ic_followed_white.png"
                }
                Text
                {
                    anchors.right: parent.right
                    anchors.rightMargin: parent.height * 0.3
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: parent.height*0.3
                    text: string.follow
                    color: palette.colorWhite
                }


                style: ButtonStyle {
                        background: Rectangle {
                            implicitWidth: 150 * app.dp
                            implicitHeight: 60 * app.dp
                            color: palette.color_follow
                            //border.width: control.activeFocus ? 2 : 1
                            //border.color: "#888"
                            radius: 80
                    }
                }
            }
        }

        Label
        {
            id: brandDetail_description
            anchors.top: brandDetail.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: text.bottom
            anchors.margins: parent.height * 0.05
            text: (modelData.description === null) ? '' : '<b>' + modelData.brand_name + ': </b>' + modelData.description
            font.pixelSize: parent.height * 0.1
            wrapMode: Text.WordWrap
        }


        Rectangle
        {
            id: brandDetail_promotion
            anchors.top: brandDetail_description.bottom
            anchors.topMargin: parent.height * 0.1
            anchors.left: parent.left
            anchors.right: parent.right
            height: parent.height * 0.6
            color: palette.colorPrimary
        }
        TabView {
            id: frame
            anchors.top: brandDetail_promotion.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            anchors.topMargin: 4

            Tab { title: string.benifit}
            Tab { title: string.store_location}
            Tab { title: string.comment }
            style: TabViewStyle {
                tabsAlignment: Qt.AlignHCenter
                    frameOverlap: 1
                    tab: Rectangle {
                        color: styleData.selected ? palette.colorPrimary : palette.colorWhite
                        border.color:  palette.colorPrimary
                        implicitWidth: (menuWidth - 50 * app.dp) / 3
                        implicitHeight: 60 * app.dp
                        radius: 1
                        Text {
                            id: text
                            anchors.centerIn: parent
                            text: styleData.title
                            color: styleData.selected ? palette.colorWhite : palette.colorPrimary
                            font.pixelSize: app.dp * 25
                        }
                    }
                    frame: Rectangle { color: "steelblue" }
                }
        }
        /*
        Rectangle
        {
            id: brandDetail_expand
            anchors.top: brandDetail_promotion.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            Button{
                anchors.top: parent.top
                anchors.topMargin: 10 * app.dp
                //anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: a
                    anchors.left: parent.left
                    text: string.store_location
                }
                Text {
                    id: b
                    anchors.right: parent.right
                    text: string.benifit
                }
                style: ButtonStyle {
                        background: Rectangle {
                            implicitWidth: 600 * app.dp
                            implicitHeight: 70 * app.dp
                            color: palette.color_follow
                            //border.width: control.activeFocus ? 2 : 1
                            //border.color: "#888"
                            radius: 8
                        }
                    }
            }
        }
        */
    }

}
