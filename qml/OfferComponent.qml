import QtQuick 2.0

Component
{
    Rectangle
    {
        anchors.left: parent.left
        anchors.right: parent.right

        height: 420 * app.dp
        color: palette.colorWhite

        Image
        {
            id: imgImage
            //anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.right: parent.right
            height: parent.height * 0.78
            fillMode: Image.PreserveAspectCrop
            //fillMode: Image.PreserveAspectFit
            source: app.prefixLogo(thumb)
            smooth: true
            antialiasing: true
        }
        Text
        {
            z: 1
            id: hotText
            anchors.right: imgImage.right
            anchors.rightMargin: parent.height * 0.04
            anchors.top: imgImage.top
            anchors.topMargin: parent.height * 0.02
            font.pixelSize: parent.height * 0.07
            text: highlight
            color: palette.colorWhite
        }
        Rectangle
        {
            z: 0
            anchors.top: parent.top
            anchors.left: hotText.left

            anchors.leftMargin: parent.height * -0.02
            anchors.rightMargin: parent.height * -0.02
            anchors.bottomMargin: parent.height * -0.02

            anchors.right: parent.right
            anchors.bottom: hotText.bottom
            color: palette.colorPrimary
        }

        Image
        {
            z: 1
            id: starImage
            //anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: parent.height * 0.05
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.07

            height: parent.height * 0.07
            fillMode: Image.PreserveAspectFit
            //fillMode: Image.PreserveAspectFit
            source: "qrc:/images/ic_rated.png"
            smooth: true
            antialiasing: true
        }
        Text
        {
            z: 1
            id: starText
            anchors.left: starImage.right
            anchors.leftMargin: parent.height * 0.02
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.08
            //anchors.verticalCenter: parent.verticalCenter
            //anchors.margins: parent.height * 0.05
            text: rated
            color: palette.colorWhite
        }

        Rectangle
        {
            z: 0
            id: recStar
            anchors.left: starImage.left
            anchors.right: starText.right
            anchors.top: starImage.top
            anchors.bottom: starImage.bottom

            anchors.margins: parent.height * -0.02
            color: palette.black_30_transparent
        }

        Text
        {
            anchors.top: imgImage.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            //anchors.verticalCenter: parent.verticalCenter
            anchors.margins: parent.height * 0.02
            text: title
            font.pixelSize: parent.height * 0.06

            wrapMode: Text.WordWrap
        }

        Rectangle
        {
            id: recDate
            anchors.left: parent.left
            anchors.bottom: imgImage.bottom
            anchors.bottomMargin: parent.height * 0.03
            height: 50 * app.dp
            width: 180 * app.dp
            color: palette.black_30_transparent
        }
        Text
        {
            anchors.top: recDate.top
            anchors.right: recDate.right
            anchors.bottom: recDate.bottom

            anchors.margins:  parent.height * 0.02
            //anchors.left: recDate.left

            //anchors.verticalCenter: parent.verticalCenter
            //anchors.horizontalCenter: parent.horizontalCenter
            //anchors.horizontalCenter: Text.horizontalAlignment
            text: app.prefixDate(end_date)
            font.pixelSize: parent.height * 0.05
            font.italic: true
            color: palette.colorWhite
        }
        Image
        {
            anchors.left: recDate.left
            anchors.bottom: recDate.bottom
            anchors.top: recDate.top
            anchors.margins:  parent.height * 0.02
            anchors.bottomMargin: parent.height * 0.04
            anchors.leftMargin: parent.height * 0.04
           // anchors.leftMargin: parent.height * 0.02
            height: parent.height*0.01
            fillMode: Image.PreserveAspectFit
            //anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/images/ic_offer_expiry_dark.png"
        }
        Rectangle
        {
            id: favouButton
            anchors.right: parent.right
            anchors.bottom: imgImage.bottom
            anchors.margins: parent.height * 0.03
            height: 50 * app.dp
            width: 100 * app.dp
            color: palette.color_bg
        }
        Text
        {
            anchors.fill: favouButton
            anchors.margins: parent.height * 0.03
            text: string.follow
            font.pixelSize: parent.height * 0.04
        }
        MouseArea {
            z: -1
            anchors.fill: parent
           // enabled: app.menuIsShown
            onClicked: {
                couponView.logoURL = app.prefixLogo(brand.logo)
                requestItem(listViewCoupon, "http://api.khuyenmai.re/api/v1/deal/?query=" + title)
                couponView.x = 0
            }
        }

    }    
}
