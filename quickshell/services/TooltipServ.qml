pragma Singleton

import Quickshell
import QtQuick

Item {
    property bool menuVisible: false
    property real posY: 0.0
    property real botL : 0.0
    property string type: "Clock"
    property var topLeft: null
    property var buttonPoses: []

    function open(type, topLeft, height) {
	this.topLeft = topLeft
	posY = topLeft.y + height / 2
	botL = topLeft.y + height
	this.type = type
	this.menuVisible = true
    }
}
