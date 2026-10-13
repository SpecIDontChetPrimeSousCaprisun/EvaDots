import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.services
import qs.config

Item {
    implicitHeight: layout.implicitHeight
    Layout.fillWidth: true
    visible: TooltipServ.type === "Battery"

    ColumnLayout {
	id: layout
	anchors.fill: parent

	Text {
	    text: "Battery power: " + Math.round((Perfs.power / Perfs.powerFull) * 100) + "%"
	    color: Theme.accent

	    font {
		family: Theme.font
		letterSpacing: -1
		pixelSize: 20
		weight: 600
	    }
	}
    }
}
