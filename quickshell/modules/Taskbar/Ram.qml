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

	Text {
	    id: icon
	    horizontalAlignment: Text.AlignHCenter
	    Layout.fillWidth: true
	    text: " "
	    color: Theme.background
	    font {
		family: Theme.font
		letterSpacing: -1
		pixelSize: 20
		weight: 600
	    }
	}

	Text {
	    id: text
	    text: "100%"
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
	    TooltipServ.open("Ram", topLeft, height)
	}
    }
}
