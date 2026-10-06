import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services

Item {
    implicitHeight: text.implicitHeight
    Layout.fillWidth: true

    Text {
	id: text
	anchors.centerIn: parent
	text: ""
	color: Theme.background
	font {
	    family: Theme.font
	    letterSpacing: -1
	    pixelSize: 27
	    weight: 600
	}
    }

    MouseArea {
	parent: text
	anchors.fill: parent
	hoverEnabled: true
	onEntered: {
	    let topLeft = this.mapToItem(null, 0, 0);
	    TooltipServ.posY = topLeft.y + height / 2
	    TooltipServ.botL = topLeft.y + height
	    TooltipServ.type = "Power"
	    TooltipServ.open()
	}
    }
}
