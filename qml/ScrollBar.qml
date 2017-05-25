import QtQuick 2.0

import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.0
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
}
