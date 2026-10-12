import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.services
import qs.config

Item {
    implicitHeight: layout.implicitHeight
    Layout.fillWidth: true
    visible: TooltipServ.type === "Gpu"

    ColumnLayout {
	id: layout
	anchors.fill: parent

	Text {
	    text: "Gpu temp: " + Perfs.gpu + "C"
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
