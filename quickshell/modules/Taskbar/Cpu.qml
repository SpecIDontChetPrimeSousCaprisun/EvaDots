import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services

Item {
    implicitHeight: layout.implicitHeight
    Layout.fillWidth: true

    ColumnLayout {
	id: layout
	anchors.fill: parent

	RowLayout {
	    Item { Layout.fillWidth: true }

	    Text {
		id: icon
		text: ""
		color: Theme.background
		font {
		    family: Theme.font
		    pixelSize: 20
		    weight: 600
		}
	    }

	    Item { Layout.fillWidth: true }
	}

	Text {
	    id: text
	    text: Math.round(Perfs.cpu) + "%"
	    horizontalAlignment: Text.AlignHCenter
	    Layout.fillWidth: true
	    color: Theme.background
	    font {
		family: Theme.font
		letterSpacing: -1
		pixelSize: 15
		weight: 600
	    }
	}
    }

    MouseArea {
	anchors.fill: parent
	hoverEnabled: true
	onEntered: {
	    let topLeft = parent.mapToItem(null, 0, 0);
	    TooltipServ.open("Cpu", topLeft, height)
	}
    }
}
