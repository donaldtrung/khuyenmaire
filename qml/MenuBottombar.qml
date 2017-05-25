import QtQuick 2.0

Rectangle {
    anchors.fill: parent
   // color: "#ff5400"
    property real _width: parent.width / 4
    Rectangle{
        id: tab_offer
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        width: _width
        color: palette.colorPrimary
       // color: "#ff4440"
        Image{
            id: img_tab_offer
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.topMargin: 5
            height: parent.height / 2
            fillMode: Image.PreserveAspectFit
            horizontalAlignment: Image.AlignHCenter

            opacity: 1
            source: "qrc:/images/ic_tab_offer.png"
        }
        Text {
            id: txt_tab_offer
            anchors.top: img_tab_offer.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            horizontalAlignment: Text.AlignHCenter
            color: palette.colorWhite

            opacity: 1
            text: string.tab_offer
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                menu_bottombar_ClickEvent(1);
                state_lib.state = 'Load_Offer_Deal';
            }
        }
    }

    Rectangle{
        id: tab_favorite
        anchors.top: parent.top
        anchors.left: tab_offer.right
        anchors.bottom: parent.bottom
        width: _width
        color: palette.colorPrimary
       // color: "#ff4440"
        Image{
            id: img_tab_favorite
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.topMargin: 5
            height: parent.height / 2
            fillMode: Image.PreserveAspectFit
            horizontalAlignment: Image.AlignHCenter

            opacity: 0.5
            source: "qrc:/images/ic_tab_favorite.png"
        }
        Text {
            id: txt_tab_favorite
            anchors.top: img_tab_favorite.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            horizontalAlignment: Text.AlignHCenter
            color: palette.colorWhite

            opacity: 0.5
            text: string.tab_favorite
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                menu_bottombar_ClickEvent(2);
                state_lib.state = 'Load_Favorite_Deal';
            }
        }
    }

    Rectangle{
        id: tab_notification
        anchors.top: parent.top
        anchors.left: tab_favorite.right
        anchors.bottom: parent.bottom
        width: _width
        color: palette.colorPrimary
       // color: "#ff4440"
        Image{
            id: img_tab_notification
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.topMargin: 5
            height: parent.height / 2
            fillMode: Image.PreserveAspectFit
            horizontalAlignment: Image.AlignHCenter

            opacity: 0.5
            source: "qrc:/images/ic_tab_notification.png"
        }
        Text {
            id: txt_tab_notification
            anchors.top: img_tab_notification.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            horizontalAlignment: Text.AlignHCenter
            color: palette.colorWhite

            opacity: 0.5
            text: string.tab_notification
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                menu_bottombar_ClickEvent(3);
                state_lib.state = 'Load_Notification';
            }
        }
    }

    Rectangle{
        id: tab_profile
        anchors.top: parent.top
        anchors.left: tab_notification.right
        anchors.bottom: parent.bottom
        width: _width
        color: palette.colorPrimary
       // color: "#ff4440"
        Image{
            id: img_tab_profile
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.topMargin: 5
            height: parent.height / 2
            fillMode: Image.PreserveAspectFit
            horizontalAlignment: Image.AlignHCenter

            opacity: 0.5
            source: "qrc:/images/ic_tab_profile.png"
        }
        Text {
            id: txt_tab_profile
            anchors.top: img_tab_profile.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            horizontalAlignment: Text.AlignHCenter
            color: palette.colorWhite

            opacity: 0.5
            text: string.tab_profile
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                menu_bottombar_ClickEvent(4);
                state_lib.state = 'Load_Profile';
            }
        }
    }

    function menu_bottombar_ClickEvent(index){
        initOpacity();
        switch(index)
        {
        case 1:
            img_tab_offer.opacity = 1
            txt_tab_offer.opacity = 1
            break;
        case 2:
            img_tab_favorite.opacity = 1
            txt_tab_favorite.opacity = 1
            break;
        case 3:
            img_tab_notification.opacity = 1
            txt_tab_notification.opacity = 1
            break;
        case 4:
            img_tab_profile.opacity = 1
            txt_tab_profile.opacity = 1
            break;
        }
    }
    function initOpacity(){
        img_tab_offer.opacity = 0.5
        txt_tab_offer.opacity = 0.5
        img_tab_favorite.opacity = 0.5
        txt_tab_favorite.opacity = 0.5
        img_tab_notification.opacity = 0.5
        txt_tab_notification.opacity = 0.5
        img_tab_profile.opacity = 0.5
        txt_tab_profile.opacity = 0.5
    }
}


