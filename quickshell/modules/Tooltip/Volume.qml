import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.services
import qs.config

Item {
    implicitHeight: layout.implicitHeight
    Layout.fillWidth: true
    visible: TooltipServ.type === "Volume"

    ColumnLayout {
	id: layout
	anchors.fill: parent

	Text {
	    text: "Output volume: " + Volume.speakerVolume * 100 + "%"
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
