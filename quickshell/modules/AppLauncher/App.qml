import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config

Rectangle {
    required property var modelData

    width: parent.width
    height: 50
    color: Theme.bgSecondary

    RowLayout {
	anchors.fill: parent
	anchors.leftMargin: 5

	Text {
	    text: modelData.name
	    color: Theme.accent
	    Layout.fillWidth: true
	    Layout.fillHeight: true
	    verticalAlignment: Text.AlignVCenter

	    font {
		family: Theme.font
		letterSpacing: -1
		pixelSize: 15
		weight: 600
	    }
	}
    }
}
