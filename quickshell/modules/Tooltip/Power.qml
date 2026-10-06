import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.services
import qs.config

Item {
    visible: TooltipServ.menuVisible
    implicitHeight: layout.implicitHeight

    ColumnLayout {
	id: layout
	anchors.fill: parent

	Text {
	    id: shutdownText
	    text: "Shutdown ⏻"
	    color: Theme.accent
	    font {
		family: Theme.font
		letterSpacing: -1
		pixelSize: 20
		weight: 600
	    }
	}

	Text {
	    id: rebootText
	    text: "Reboot "
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
