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
	text: " \n100%"
	color: Theme.background
	font {
	    family: Theme.font
	    letterSpacing: -1
	    pixelSize: 15
	    weight: 600
	}
    }

    MouseArea {
	parent: text
	anchors.fill: parent
	hoverEnabled: true
	preventStealing: true
	onEntered: {
	    let topLeft = parent.mapToItem(null, 0, 0);
	    TooltipServ.open("Microphone", topLeft, height)
	}
    }
}
