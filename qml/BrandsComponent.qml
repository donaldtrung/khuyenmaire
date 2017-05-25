import QtQuick 2.0

import QtQuick 2.4
import QtQuick.Controls 1.2
Component {
    Rectangle {
        height: app.menuHeight
        width: parent.width
        //color: wrapperItem.ListView.isCurrentItem || ma.pressed ? palette.currentHighlightItem : "transparent"
        Image {
            id: imgFavouriteBrand
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: parent.height*0.3
            height: parent.height*0.5
            //width: parent.width * 0.05
            fillMode: Image.PreserveAspectFit
            source: is_followed ? "qrc:/images/ic_favorite_brand_active.png" : "qrc:/images/ic_favorite_brand.png"
            smooth: true
            antialiasing: true
        }
        Image {
            id: imgLogo
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: imgFavouriteBrand.right
            anchors.top: parent.top
            //anchors.bottom: parent.bottom
            anchors.margins: parent.height * 0.1
            //anchors.leftMargin: parent.width * - 0.1
            height: parent.height
            width: parent.height * 2
            fillMode: Image.PreserveAspectFit
            //source: "http://storage.googleapis.com/jamja-prod/gcs_full_588046ea76ec577246612b33-2017-01-19-045610.png"
            source: app.prefixLogo(logo)
           // visible: logo != ""
            smooth: true
            antialiasing: true
        }
        Rectangle{
            anchors.top: imgLogo.bottom
            anchors.topMargin: parent.height*0.1
            height: parent.height*0.01
            width: parent.width
            color: palette.colorBackground
        }

        Label
        {
            id: label_menu
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: parent.height * 2
            Image{
                id: imgLoadmore
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                height: parent.height*0.5
                width: height
                fillMode: Image.PreserveAspectFit
                source: "qrc:/images/ic_more.png"
            }
            Text
            {
                text: string.view_deal
                anchors.left: label_menu.left
                anchors.verticalCenter: parent.verticalCenter

                font.pixelSize: parent.height*0.3
                color: palette.colorPrimary
            }
            MouseArea {
                anchors.fill: parent
                //enabled: app.menuIsShown
                onClicked: {
                    brandsView.index = id;
                    requestItem(listViewBrand, "http://api.khuyenmai.re/api/v1/brand/?query=" + brand_name)
                    brandView.x = 0
                }
            }
        }
    }
}
