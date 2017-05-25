import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.0

Component
{
    Item
    {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left: parent.left
        height: parent.width * 0.5
        width: parent.width

        Image
        {
            id: imgCoupon
            //anchors.verticalCenter: parent.verticalCenter
            //anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            //anchors.topMargin: parent.height * 0.1
            height: parent.height
            width: parent.width
            fillMode: Image.PreserveAspectCrop
            source: app.prefixLogo(modelData.thumb)
            smooth: true
            antialiasing: true
        }
        Rectangle
        {
            anchors.top: imgCoupon.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            color: palette.colorWhite
        }

        Label
        {
            id: labelCoupon
            anchors.top: imgCoupon.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            Text
            {
                id: labelCouponTitle
                anchors.top: imgCoupon.bottom
                anchors.left: parent.left
                anchors.right: parent.right

                anchors.margins: parent.height
                text: modelData.title
                font.pixelSize: parent.height * 2

                wrapMode: Text.WordWrap
                color: palette.colorTitle
            }
            Text
            {
                id: labelCouponHot
                anchors.top: labelCouponTitle.bottom
                anchors.left: parent.left
                anchors.topMargin: parent.height * 1.5
                anchors.leftMargin: parent.height
                enabled: true
                text: modelData.is_highlight ? modelData.highlight : labelCouponHot.enabled = false
                color: palette.colorPrimary
                font.pixelSize: parent.height * 1.5
            }
            Text
            {
                id: labelCouponDate
                anchors.top: labelCouponTitle.bottom
                anchors.right: parent.right
                anchors.topMargin: parent.height * 1.9
                anchors.rightMargin: parent.height

                text: app.prefixDate(modelData.end_date)
                color: palette.colorDetailDate
                font.pixelSize: parent.height
            }
            Image
            {
                anchors.top: labelCouponTitle.bottom
                anchors.right: labelCouponDate.left
                anchors.topMargin: parent.height * 2
                anchors.rightMargin: parent.height * 0.5

                height: parent.height
                fillMode: Image.PreserveAspectFit
                //anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/images/ic_offer_expiry.png"
            }
            Label
            {
                id: labelCouponRate
                anchors.top: labelCouponHot.bottom
                anchors.topMargin: parent.height * 3
                anchors.left: parent.left
                anchors.right: parent.right

                Text
                {
                    id: labelCouponRateText
                    anchors.top: parent.top
                    anchors.topMargin: parent.height * 0.3
                    anchors.left: parent.left
                    anchors.leftMargin: parent.height * 0.5
                    text: string.rate +' <font color="#ff5400"><b>' + modelData.rated + '</b></font>'

                    font.pixelSize: parent.height * 1.2
                }
                Label
                {
                    id: labelRate
                    anchors.top: parent.top
                    anchors.topMargin: parent.height * 0.5
                    anchors.left: labelCouponRateText.right
                    Image
                    {
                        id: star1
                        anchors.left: parent.left
                        anchors.leftMargin: parent.height * 0.5
                        height: parent.height * 2
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter: parent.verticalCenter
                        source: "qrc:/images/ic_offer_favorite.png"
                    }
                    Image
                    {
                        id: star2
                        anchors.left: star1.right
                        anchors.leftMargin: parent.height * 0.5
                        height: parent.height * 2
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter: parent.verticalCenter
                        source: "qrc:/images/ic_offer_favorite.png"
                    }
                    Image
                    {
                        id: star3
                        anchors.left: star2.right
                        anchors.leftMargin: parent.height * 0.5
                        height: parent.height * 2
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter: parent.verticalCenter
                        source: "qrc:/images/ic_offer_favorite.png"
                    }
                    Image
                    {
                        id: star4
                        anchors.left: star3.right
                        anchors.leftMargin: parent.height * 0.5
                        height: parent.height * 2
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter: parent.verticalCenter
                        source: "qrc:/images/ic_offer_favorite.png"
                    }
                    Image
                    {
                        id: star5
                        anchors.left: star4.right
                        anchors.leftMargin: parent.height * 0.5
                        height: parent.height * 2
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter: parent.verticalCenter
                        source: "qrc:/images/ic_offer_favorite.png"
                    }
                }
                Button
                {
                    anchors.top: parent.top
                    anchors.topMargin: parent.height * -0.5
                    anchors.right: parent.right
                    //anchors.verticalCenter: parent.verticalCenter
                    //anchors.horizontalCenter: parent.horizontalCenter
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
                                implicitWidth: 180 * app.dp
                                implicitHeight: 70 * app.dp
                                color: palette.color_follow
                                //border.width: control.activeFocus ? 2 : 1
                                //border.color: "#888"
                                radius: 80
                                /*
                                gradient: Gradient {
                                    GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                    GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                                }
                                */
                            }
                        }
                }
                Rectangle
                {
                    id: recPromote
                    anchors.top: labelCouponRateText.bottom
                    anchors.topMargin: parent.height
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: parent.height * 10
                    color: palette.colorPrimary
                }
            }
        }

        /*
        Rectangle
        {
            id: couponDetail
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: parent.height * 2
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
                source: logo
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

                text: name

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
                            /*
                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                            }
                        }
                    }
            }
        }
                            */

    }
}
