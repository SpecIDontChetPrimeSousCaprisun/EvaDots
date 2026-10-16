import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.services
import qs.config

Item {
    implicitHeight: layout.implicitHeight + 5
    Layout.fillWidth: true
    visible: TooltipServ.type === "Battery"

    ColumnLayout {
	id: layout
	anchors.fill: parent
	anchors.leftMargin: 5
	anchors.bottomMargin: 5

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

	Text {
	    text: Perfs.power / 1000000 + "Wh / " + Perfs.powerFull / 1000000 + "Wh"
	    color: Theme.secondary

	    font {
		family: Theme.font
		letterSpacing: -1
		pixelSize: 15
		weight: 600
	    }
	}

	RowLayout {
	    Text {
		id: powerIcon

		text: "⚡"
		color: Theme.bgSecondary
		
		font {
		    family: Theme.font
		    letterSpacing: -1
		    pixelSize: 100
		    weight: 600
		}

		Item {
		    width: parent.width
		    height: parent.height * (Perfs.power / Perfs.powerFull)
		    anchors.bottom: parent.bottom
		    clip: true

		    Text {
			text: "⚡"
			color: Theme.accent
			anchors.bottom: parent.bottom
			
			font {
			    family: Theme.font
			    letterSpacing: -1
			    pixelSize: 100
			    weight: 600
			}
		    }
		}
	    }
	}
    }
}
