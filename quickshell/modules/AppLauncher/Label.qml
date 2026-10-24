import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config

Item {
    Layout.fillWidth: true
    height: 50
    clip: true

    Rectangle {
	height: parent.height
	width: label.width
	color: Theme.accent
	anchors.centerIn: parent

	Text {
	    id: label
	    text: "Apps"
	    anchors.centerIn: parent
	    color: Theme.background

	    font {
		family: Theme.font
		pixelSize: 30
	    }
	}

	Rectangle {
	    x: -parent.height
	    y: -parent.height
	    z: -1
	    width: parent.height * 2
	    height: parent.height * 2
	    color: Theme.accent
	    radius: 100000
	}

	Rectangle {
	    x: parent.width - parent.height
	    y: -parent.height
	    z: -1
	    width: parent.height * 2
	    height: parent.height * 2
	    color: Theme.accent
	    radius: 100000
	}
    }
}
