import QtQuick 2.0

Component
{
    Rectangle
    {
        anchors.left: parent.left
        anchors.right: parent.right
        //property string text:  '<b>' + brand + '</b>' + " vừa cập nhật ưu đãi mới. "
        //                       + '"<font color="#ff5400"><b>' + title + '</b></font>"'
        //                       + " đến " + date_expire
        height: 147 * app.dp
        color: palette.colorWhite

        Image
        {
            id: imgLogo
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: parent.height*0.1
            height: parent.height * 0.9
            width: height
            fillMode: Image.PreserveAspectCrop
            source: image
            smooth: true
            antialiasing: true
        }

        Text
        {
            id: notiBrandText
            anchors.left: imgLogo.right
            anchors.leftMargin: parent.height * 0.1
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.1
            anchors.bottom: imgClock.top
            anchors.right: parent.right
            text: '<b>' + brand + '</b>' + " vừa cập nhật ưu đãi mới. "
                  + '"<font color="#ff5400"><b>' + title + '</b></font>"'
                  + " đến " + date_expire
            wrapMode: Text.WordWrap
           // clip: true
        }
        Image
        {
            id: imgClock
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height * 0.1
            anchors.left: imgLogo.right
            anchors.leftMargin: parent.height * 0.1
            width: parent.height * 0.2
            height: width
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/ic_offer_date.png"
        }
        Text
        {
            anchors.left: imgClock.right
            anchors.leftMargin: parent.height * 0.1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height * 0.1
            text: date
            color: "black"
        }
    }
}
