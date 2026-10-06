pragma Singleton

import Quickshell
import QtQuick

Item {
    property bool menuVisible: false
    property real posY: 0.0
    property real botL : 0.0
    property string type: "Clock"

    function open() {
	this.menuVisible = true
    }
}
