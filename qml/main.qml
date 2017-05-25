import QtQuick 2.4
import QtQuick.Window 2.2
import Qt.labs.settings 1.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.0

import mydevice 1.0

ApplicationWindow {
    id: app

    property string appTitle: ""

    width: 390
    height: 667
    //width: 640
    //height: 360

    visible: true

    property alias dp: device.dp
    MyDevice { id: device }



    String
    {
        id: string
    }
    Color
    {
        id: palette
    }



    property int orientationPortrait: 1
    property int orientationLandscape: 2
    property int orientation: 0
    onWidthChanged: {
        if( width > height ) {
            app.orientation = app.orientationLandscape
        } else {
            app.orientation = app.orientationPortrait
        }
    }

    Settings {
        id: settings
    }

    //property string version: "2015100901"

    property alias currentPage: loader.source
    property string currentAppTitle: app.appTitle

    property int durationOfMenuAnimation: 500
    property int menuWidth: app.width//app.orientation == app.orientationLandscape ? 300*app.dp : app.width*0.85
    property int menuHeight: 100 * app.dp
    property int searchHeight: 90 * app.dp
    property int widthOfSeizure: 15*app.dp
    property bool menuIsShown: Math.abs(brandsView.x) < (menuWidth*0.5) ? true : false
    property real menuProgressOpening


    Rectangle{
        id: searchBrandsView
        z:1
        //anchors.top: menuBar.bottom
        //anchors.topMargin: 100 * app.dp
        width: parent.width
        height: searchHeight
        //x: - menuWidth
        x: - menuWidth
        y: menuHeight
        //z: 6

        Behavior on x { NumberAnimation { duration: app.durationOfMenuAnimation; easing.type: Easing.OutQuad } }

        color: palette.color_bg


        TextField
        {
            id: searchBrandsField
            anchors.fill: parent
            anchors.margins: 10 * app.dp
            onTextChanged: updateFilterBrands(text)
            placeholderText: string.brand_search
            horizontalAlignment: TextInput.AlignHCenter
            font.pixelSize: 30 * app.dp
            maximumLength: 20

            style: TextFieldStyle {
                    textColor: palette.colorPrimary
                    background: Rectangle {
                        radius: 5
                        border.color: palette.color_bg
                        border.width: 1
                    }
                }
        }
    }

    Rectangle{
        id: searchDealsView
        z: 1
        //anchors.top: menuBar.bottom
        //anchors.topMargin: 100 * app.dp
        width: parent.width
        height: searchHeight
        x: - menuWidth
        y: menuHeight

        Behavior on x { NumberAnimation { duration: app.durationOfMenuAnimation; easing.type: Easing.OutQuad } }

        color: palette.color_bg


        TextField
        {
            id: searchDealsField
            anchors.fill: parent
            anchors.margins: 10 * app.dp
            onTextChanged: updateFilterDeals(text)
            placeholderText: string.deal_search
            horizontalAlignment: TextInput.AlignHCenter
            font.pixelSize: 30 * app.dp
            maximumLength: 20

            style: TextFieldStyle {
                    textColor: palette.colorPrimary
                    background: Rectangle {
                        radius: 5
                        border.color: palette.color_bg
                        border.width: 1
                    }
                }
        }
    }

    Rectangle {
        id: normalView
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        color: palette.secondary

        //*************************************************//
        Rectangle {
            id: menuBar
            z: 5
            anchors.top: parent.top
            anchors.topMargin: 0
            width: parent.width
            height: app.orientation == app.orientationLandscape ? 40*app.dp : menuHeight
            color: palette.colorPrimary
            Rectangle {
                id: menuButton
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                width: 1.2*height
                height: parent.height
                scale: maMenuBar.pressed ? 1.2 : 1
                color: "transparent"
                MenuIconLive {
                    id: menuBackIcon
                    scale: (parent.height/height)*0.5
                    anchors.centerIn: parent
                    value: menuProgressOpening
                }
                MouseArea {
                    id: maMenuBar
                    anchors.fill: parent
                    onClicked: onBrands()
                }
                clip: true
            }
            Label {
                id: titleText
                anchors.left: menuButton.right
                anchors.verticalCenter: parent.verticalCenter
                text: appTitle
                font.pixelSize: 0.35*parent.height
                color: palette.colorWhite
            }
            Image
            {
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.margins: parent.height * 0.2
                anchors.rightMargin: parent.width * 0.3
                fillMode: Image.PreserveAspectFit
                source: "qrc:/images/ic_search.png"

                MouseArea {
                    id: searchIconClick
                    anchors.fill: parent
                    onClicked: onDeals()
                }
            }
        }
        Image {
            id: imgShadow
            anchors.top: menuBar.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: 6*app.dp
            z: 4
            source: "qrc:/images/shadow_title.png"
        }

        Loader {
            id: menuBottombar

            property int index: -1
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: 92 * app.dp
            z:2
            source: "MenuBottombar.qml"
            }

        //*************************************************//
        Rectangle {
            id: brandsView
            anchors.top: menuBar.bottom
            anchors.bottom: parent.bottom
            //height: parent.height - menuBar.height
            width: menuWidth
            property string queryBrands: null
            z: 3
            property int index: 3
            ScrollView {
                id: scrollBrandsView
             anchors.fill: parent
             flickableItem.interactive: true

             style: ScrollViewStyle {                 
                     transientScrollBars: true
                     handle: Item {
                         implicitWidth: 10
                         implicitHeight: 50
                         Rectangle {
                             color: palette.color_bg
                             anchors.fill: parent
                             anchors.topMargin: searchHeight + 6
                             anchors.leftMargin: 4
                             anchors.rightMargin: 4
                             anchors.bottomMargin: 6
                         }
                     }
                     scrollBarBackground: Item {
                         implicitWidth: 10
                         implicitHeight: 50
                     }
                 }
                ListView {
                    property string nextUrl: null
                    property bool canAppend: true

                    anchors.top: parent.top
                    anchors.topMargin: searchHeight
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom

                    id: listViewBrands
                    delegate: brandsComponent
                    clip: true
                    model: ListModel{}
                    onContentYChanged:
                    {
                        if(scrollBrandsView.flickableItem.visibleArea.yPosition > 0.5){
                            if(nextUrl !== null)
                                request(listViewBrands, nextUrl)
                        }
                    }

                  }
                Component.onCompleted: {
                        brandsView.queryBrands = "http://api.khuyenmai.re/api/v1/brand/"
                        request(listViewBrands, brandsView.queryBrands)
                   }
            }

            x: -menuWidth

            Behavior on x { NumberAnimation { duration: app.durationOfMenuAnimation; easing.type: Easing.OutQuad } }
            onXChanged: {
                menuProgressOpening = (1-Math.abs(brandsView.x/menuWidth))
            }
        }

        // Deal search
        Rectangle{
            id: dealsView
            width: parent.width
            height: parent.height
            x: - menuWidth
            y: 0
            z: 5
            Behavior on x { NumberAnimation { duration: app.durationOfMenuAnimation; easing.type: Easing.OutQuad } }

            color: palette.color_bg
            property string queryDeals: null
            Rectangle {
                id: dealsView_menuBar
                z: 5
                anchors.top: parent.top
                width: parent.width
                height: app.orientation == app.orientationLandscape ? 40*app.dp : menuHeight
                color: palette.colorPrimary
                Rectangle {
                    id: dealsView_menuButton
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    width: 1.2*height
                    height: parent.height
                    scale: dealsView_maMenuBar.pressed ? 1.2 : 1
                    color: "transparent"
                    Image {
                        anchors.centerIn: parent
                        height: parent.height * 0.5
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/images/ic_back.png"
                    }
                    MouseArea {
                        id: dealsView_maMenuBar
                        anchors.fill: parent
                        onClicked: dealsView_backToMenu()
                    }
                    clip: true
                }
                Label {
                    id: dealsView_titleText
                    anchors.left: dealsView_menuButton.right
                    anchors.rightMargin: 0.2 * parent.height
                    anchors.verticalCenter: parent.verticalCenter
                    text: string.app_name
                    font.pixelSize: 0.35*parent.height
                    color: palette.colorWhite
                }
            }

            Image {
                anchors.top: dealsView_menuBar.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                height: 6*app.dp
                z: 4
                source: "qrc:/images/shadow_title.png"
            }
            Loader
            {
                anchors.top: dealsView_menuBar.bottom
                anchors.topMargin: searchHeight * 2
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom

                ScrollView {                    
                 anchors.fill: parent
                 flickableItem.interactive: true
                 style: ScrollViewStyle {
                         transientScrollBars: true
                         handle: Item {
                             implicitWidth: 10
                             implicitHeight: 50
                             Rectangle {
                                 color: palette.color_bg
                                 anchors.fill: parent
                                 anchors.topMargin: 6
                                 anchors.leftMargin: 4
                                 anchors.rightMargin: 4
                                 anchors.bottomMargin: 6
                             }
                         }
                         scrollBarBackground: Item {
                             implicitWidth: 10
                             implicitHeight: 50
                         }
                     }
                    ListView
                    {
                        id: listViewDeals
                        header: searchDealsView
                        anchors.fill: parent
                        clip: true
                        //model: modelBrand
                        delegate: offerComponent
                    }
                    Component.onCompleted: {
                            dealsView.queryDeals = "http://api.khuyenmai.re/api/v1/deal"
                            request(listViewDeals, dealsView.queryDeals)
                    }

                   // onActiveFocusChanged: {if(Flickable.visibleArea.yPosition === 1.0) print("end") }

                }

            }            
        }
        //

        Image {
            id: imgShadowMenu
            anchors.top: menuBar.bottom
            anchors.bottom: brandsView.bottom
            anchors.left: brandsView.right
            width: 6*app.dp
            z: 5
            source: "qrc:/images/shadow_long.png"
            visible: brandsView.x != -menuWidth
        }
        Rectangle {
            id: curtainMenu
            z: 1
            anchors.fill: parent
            color: "black"
            opacity: app.menuProgressOpening*0.5
        }

        //*************************************************//
        Loader {
            id: loader
            anchors.top: menuBar.bottom;
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: menuBottombar.top

            ScrollView {
                id: scrollLoader
             anchors.fill: parent
             flickableItem.interactive: true

             style: ScrollViewStyle {
                     transientScrollBars: true
                     handle: Item {
                         implicitWidth: 10
                         implicitHeight: 50
                         Rectangle {
                             color: palette.color_bg
                             anchors.fill: parent
                             anchors.topMargin: 6
                             anchors.leftMargin: 4
                             anchors.rightMargin: 4
                             anchors.bottomMargin: 6
                         }
                     }
                     scrollBarBackground: Item {
                         implicitWidth: 10
                         implicitHeight: 50
                     }
                 }

                ListView
                {
                    property string nextUrl: null
                    property bool canAppend: true

                    anchors.fill: parent
                    id: listViewLoader
                    delegate: offerComponent
                    clip: true
                    model: ListModel{}
                    onContentYChanged:
                    {
                        if(scrollLoader.flickableItem.visibleArea.yPosition > 0.8){
                            if(nextUrl !== null)
                                request(listViewLoader, nextUrl)
                        }
                    }
                }

                Component.onCompleted: {
                    request(listViewLoader, "http://api.khuyenmai.re/api/v1/deal")
                }
            }
        }
    }

    Rectangle{
        id: brandView
        width: parent.width
        height: parent.height
        x: menuWidth
        y: 0
        z: 5
        Behavior on x { NumberAnimation { duration: app.durationOfMenuAnimation; easing.type: Easing.OutQuad } }

        color: palette.colorWhite
        Rectangle {
            id: brandView_menuBar
            z: 5
            anchors.top: parent.top
            anchors.topMargin: 0
            width: parent.width
            height: app.orientation == app.orientationLandscape ? 40*app.dp : menuHeight
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
            z: 5
            source: "qrc:/images/shadow_title.png"
        }
        Loader
        {
            anchors.top: brandView_menuBar.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            ScrollView {
             anchors.fill: parent
             flickableItem.interactive: true

             style: ScrollViewStyle {
                     transientScrollBars: true
                     handle: Item {
                         implicitWidth: 10
                         implicitHeight: 50
                         Rectangle {
                             color: palette.colorPrimary
                             anchors.fill: parent
                             anchors.topMargin: 6
                             anchors.leftMargin: 4
                             anchors.rightMargin: 4
                             anchors.bottomMargin: 6
                         }
                     }
                     scrollBarBackground: Item {
                         implicitWidth: 10
                         implicitHeight: 50
                     }
                 }
                ListView
                {
                    property string nextUrl: null
                    property bool canAppend: true

                    anchors.fill: parent
                    id: listViewBrand
                    delegate: brandComponent
                    clip: true
                    model: ListModel{}
                    onContentYChanged:
                    {
                        if(scrollLoader.flickableItem.visibleArea.yPosition > 0.8){
                            if(nextUrl !== null)
                                request(listViewBrand, nextUrl)
                        }
                    }
                }
            }
        }
    }

    Rectangle{
        id: couponView
        anchors.top: parent.top
        width: parent.width
        height: parent.height
        x: menuWidth
        Behavior on x { NumberAnimation { duration: app.durationOfMenuAnimation; easing.type: Easing.OutQuad } }

        property string logoURL: null
        color: palette.colorWhite
        Rectangle {
            id: couponView_menuBar
            anchors.top: parent.top
            anchors.topMargin: 0
            width: parent.width
            height: app.orientation == app.orientationLandscape ? 40*app.dp : menuHeight
            color: palette.colorWhite
            Rectangle {
                id: couponView_menuButton
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
                    id: couponView_maMenuBar
                    anchors.fill: parent
                    onClicked: couponView_backToMenu()
                }
                clip: true

            }
            Image {
                id: couponView_titleText
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 0.2 * parent.height
                anchors.verticalCenter: parent.verticalCenter

                //height: app.dp * 30
                width: parent.height * 1.5
                //anchors.centerIn: parent
                fillMode: Image.PreserveAspectFit
                source: couponView.logoURL
                //source: "http://storage.googleapis.com/jamja-prod/gcs_full_588089a076ec571d7df88025-2017-01-19-094049.png"

            }
        }
        Image {
            anchors.top: couponView_menuBar.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: 6*app.dp
            z: 4
            source: "qrc:/images/shadow_title.png"
        }
        ScrollView {
            anchors.top: couponView_menuBar.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom

         flickableItem.interactive: true

         style: ScrollViewStyle {
                 transientScrollBars: true
                 handle: Item {
                     implicitWidth: 10
                     implicitHeight: 50
                     Rectangle {
                         color: palette.color_bg
                         anchors.fill: parent
                         anchors.topMargin: 6
                         anchors.leftMargin: 4
                         anchors.rightMargin: 4
                         anchors.bottomMargin: 6
                     }
                 }
                 scrollBarBackground: Item {
                     implicitWidth: 10
                     implicitHeight: 50
                 }
             }
            ListView
            {
                id: listViewCoupon
                anchors.fill: parent
                clip: true
                //model: couponModel
                delegate: couponComponent
            }
        }
    }

    ListModel
    {
        id: notiModel
        ListElement{
            brand: "Bolzano"
            title: "Ưu đãi siêu khủng 70% cho tín đồ thời trang tha hồ mua sắm"
            date_expire: "27-01-2017"
            date: "03-02-2017"
            image: "http://storage.googleapis.com/jamja-prod/gcs_full_588089a076ec571d7df88025-2017-01-19-094049.png"
        }
        ListElement{
            brand: "Bolzano"
            title: "Ưu đãi siêu khủng 70% cho tín đồ thời trang tha hồ mua sắm"
            date_expire: "27-01-2017"
            date: "03-02-2017"
            image: "http://storage.googleapis.com/jamja-prod/gcs_full_588089a076ec571d7df88025-2017-01-19-094049.png"
        }
        ListElement{
            brand: "Bolzano"
            title: "Ưu đãi siêu khủng 70% cho tín đồ thời trang tha hồ mua sắm"
            date_expire: "27-01-2017"
            date: "03-02-2017"
            image: "http://storage.googleapis.com/jamja-prod/gcs_full_588089a076ec571d7df88025-2017-01-19-094049.png"
        }
        ListElement{
            brand: "Bolzano"
            title: "Ưu đãi siêu khủng 70% cho tín đồ thời trang tha hồ mua sắm"
            date_expire: "27-01-2017"
            date: "03-02-2017"
            image: "http://storage.googleapis.com/jamja-prod/gcs_full_588089a076ec571d7df88025-2017-01-19-094049.png"
        }
        ListElement{
            brand: "Bolzano"
            title: "Ưu đãi siêu khủng 70% cho tín đồ thời trang tha hồ mua sắm"
            date_expire: "27-01-2017"
            date: "03-02-2017"
            image: "http://storage.googleapis.com/jamja-prod/gcs_full_588089a076ec571d7df88025-2017-01-19-094049.png"
        }
        ListElement{
            brand: "Bolzano"
            title: "Ưu đãi siêu khủng 70% cho tín đồ thời trang tha hồ mua sắm"
            date_expire: "27-01-2017"
            date: "03-02-2017"
            image: "http://storage.googleapis.com/jamja-prod/gcs_full_588089a076ec571d7df88025-2017-01-19-094049.png"
        }
        ListElement{
            brand: "Bolzano"
            title: "Ưu đãi siêu khủng 70% cho tín đồ thời trang tha hồ mua sắm"
            date_expire: "27-01-2017"
            date: "03-02-2017"
            image: "http://storage.googleapis.com/jamja-prod/gcs_full_588089a076ec571d7df88025-2017-01-19-094049.png"
        }
        ListElement{
            brand: "Bolzano"
            title: "Ưu đãi siêu khủng 70% cho tín đồ thời trang tha hồ mua sắm"
            date_expire: "27-01-2017"
            date: "03-02-2017"
            image: "http://storage.googleapis.com/jamja-prod/gcs_full_588089a076ec571d7df88025-2017-01-19-094049.png"
        }
        ListElement{
            brand: "Bolzano"
            title: "Ưu đãi siêu khủng 70% cho tín đồ thời trang tha hồ mua sắm"
            date_expire: "27-01-2017"
            date: "03-02-2017"
            image: "http://storage.googleapis.com/jamja-prod/gcs_full_588089a076ec571d7df88025-2017-01-19-094049.png"
        }
    }

    ListModel
    {
        id: profileModel
        ListElement
        {
            image: "http://storage.googleapis.com/jamja-prod/gcs_full_588089a076ec571d7df88025-2017-01-19-094049.png"

            points: 0
            total: 0
        }
    }

    OfferComponent
    {
        id: offerComponent
    }
    NotiComponent
    {
        id: notiComponent
    }
    ProfileComponent
    {
        id: profileComponent
    }
    CouponComponent
    {
        id: couponComponent
    }
    BrandComponent
    {
        id: brandComponent
    }
    BrandsComponent
    {
        id: brandsComponent
    }

    Item
    {
        id: state_lib
        states:
        [
            State{
                name: "Load_Offer_Deal"
                PropertyChanges {
                    target: listViewLoader
                    model: offerModel
                    delegate: offerComponent
                    }
                PropertyChanges {
                    target: menuBottombar
                    //index: 1
                    }
            },
            State{
                name: "Load_Favorite_Deal"
                PropertyChanges {
                    target: app
                    appTitle: string.tab_favorite
                    }
                PropertyChanges {
                    target: menuBottombar
                    //index: 2
                }
                PropertyChanges {
                    target: listViewLoader
                    model: null
                    delegate: null
                    }
            },
            State{
                name: "Load_Notification"
                PropertyChanges {
                    target: app
                    appTitle: string.tab_notification
                    }
                PropertyChanges {
                    target: listViewLoader
                    model: notiModel
                    delegate: notiComponent
                    }
                PropertyChanges {
                    target: menuBottombar
                    //index: 3
                }
            },
            State{
                name: "Load_Profile"
                PropertyChanges {
                    target: app
                    appTitle: string.tab_profile
                    }
                PropertyChanges {
                    target: listViewLoader
                    model: offerModel
                    delegate: offerComponent
                    }
                PropertyChanges {
                    target: listViewLoader
                    model: profileModel
                    delegate: profileComponent
                    }
                PropertyChanges {
                    target: menuBottombar
                    //index: 4
                }
            },
            State{
                name: "Load_Coupon"
                PropertyChanges {
                    target: listViewLoader
                    model: null
                    delegate: null
                }
            },
            State{
                name: "Load_Deals_Search"
                PropertyChanges {
                    target: app
                    appTitle: string.app_name
                    }
            }
            /*,
            State{
                name: "test"
                PropertyChanges {
                    target: listViewBrand
                    //model: null
                    delegate: null
                    Component.onCompleted:
                        request(listViewBrand, "http://api.khuyenmai.re/api/v1/brand/?query=" + "korea")
                }
            }
            */
        ]
    }

    function request(modelId, url) {
            if(url === "")
                return

            var xhr = new XMLHttpRequest();
            xhr.open("GET", url, true);
            xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            xhr.setRequestHeader('Token', "1");

            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
                } else if(xhr.readyState === XMLHttpRequest.DONE) {
                    var json = JSON.parse(xhr.responseText.toString())

                    if(modelId.canAppend)
                            modelId.model.append(json.data)


                    if(json.next === null)
                    {
                        modelId.nextUrl = ""
                        modelId.canAppend = false
                    }
                    else
                    {
                        modelId.nextUrl = "http://api.khuyenmai.re" + json.next
                        modelId.canAppend = true
                    }
                }
            }

            xhr.send();
    }
    function requestItem(modelId, url) {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", url, true);
            xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            xhr.setRequestHeader('Token', "1");

            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
                } else if(xhr.readyState === XMLHttpRequest.DONE) {
                    var json = JSON.parse(xhr.responseText.toString())
                    modelId.model = json.data
                }
            }

            xhr.send();
    }

    function onBrands() {
        brandsView.x = app.menuIsShown ? -menuWidth : 0
        searchBrandsView.x = app.menuIsShown ? -menuWidth : 0
    }
    function onDeals() {
        dealsView.x = app.menuIsShown ? -menuWidth : 0
        searchDealsView.x = app.menuIsShown ? -menuWidth : 0
    }
    function dealsView_backToMenu() {
        dealsView.x =  -menuWidth
        searchDealsView.x = -menuWidth
    }
    function brandView_backToMenu() {
        brandView.x =  menuWidth        
    }   
    function couponView_backToMenu() {
        couponView.x =  menuWidth
    }
    function prefixLogo(string) // https -> http
    {
        if(string[4] === 's')
            return string.substr(0, 4) + string.substr(5, string.length)

        return string
    }
    function prefixDate(string)
    {
        //y = string.substr(0, 4)
        //m = string.substr(5, 2)
        //d = string.substr(8, 2)
        return string.substr(8, 2) + "-" + string.substr(5, 2) + "-" + string.substr(0, 4)
    }
    function resetListView(modelId)
    {
        modelId.model.clear()
        modelId.nextUrl = ""
        modelId.canAppend = true
    }

    function updateFilterBrands(string)
    {
        resetListView(listViewBrands)

        if(string === "")
            brandsView.queryBrands = "http://api.khuyenmai.re/api/v1/brand"
        else
            brandsView.queryBrands = "http://api.khuyenmai.re/api/v1/brand/?query=" + string

        request(listViewBrands, brandsView.queryBrands)
    }

    function updateFilterDeals(string)
    {
        resetListView(listViewDeals)

        if(string === "")
            dealsView.queryDeals = "http://api.khuyenmai.re/api/v1/deal"
        else
            dealsView.queryDeals = "http://api.khuyenmai.re/api/v1/deal/?query=" + string

        request(listViewDeals, dealsView.queryDeals)
    }
}
