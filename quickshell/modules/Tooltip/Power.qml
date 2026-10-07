import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.services
import qs.config
import qs.components

Item {
    visible: TooltipServ.type === "Power"
    Layout.fillWidth: true
    implicitHeight: buttons.length * 30 + 5

    property var buttons: [
	{ name: "Shutdown ⏻", command: [ "poweroff" ] },
	{ name: "Reboot ", command: [ "reboot" ] },
	{ name: "Hibernate ", command: [ "systemctl", "hybernate" ] },
	{ name: "Sleep 󰒲", command: [ "systemctl", "suspend" ] },
	{ name: "Lock ", command: [ "qs", "ipc", "call", "lock", "lock" ] }
    ]

    ColumnLayout {
	id: layout
	anchors.fill: parent
	anchors.leftMargin: 5
	spacing: -1

	Repeater {
	    model: buttons
	    delegate: Item {
		required property var modelData

		implicitWidth: text.implicitWidth
		implicitHeight: text.implicitHeight

		Text {
		    id: text
		    text: parent.modelData.name
		    color: Theme.accent
		    font {
			family: Theme.font
			letterSpacing: -1
			pixelSize: 20
			weight: 600
		    }

		    Rectangle {
			anchors.top: parent.bottom
			height: 2
			width: mouse.containsMouse ? parent.width : 0
			color: Theme.accent
			radius: 100

			Behavior on width {
			    Anim {}
			}
		    }
		}

		MouseArea {
		    id: mouse
		    parent: text
		    anchors.fill: parent
		    hoverEnabled: true
		}
	    }
	}
    }
}
