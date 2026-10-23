import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import qs.components
import qs.config
import qs.modules
import qs.services

StyledWindow {
    id: win

    required property ShellScreen modelData

    name: "background"
    visible: Apps.launcherOpen
    WlrLayershell.exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Overlay

    anchors.top: true
    anchors.bottom: true
    anchors.left: true
    anchors.right: true

    Widget {
	width: layout.implicitWidth
	height: layout.implicitHeight
	anchors.centerIn: parent

	ColumnLayout {
	    id: layout
	    anchors.fill: parent

	    Item {
		Layout.fillWidth: true
		height: 50
		clip: true

		Rectangle {
		    height: parent.height
		    width: label.width
		    color: Theme.accent
		    anchors.centerIn: parent

		    Text {
			id: label
			text: "Apps"
			anchors.centerIn: parent
			color: Theme.background

			font {
			    family: Theme.font
			    pixelSize: 30
			}
		    }

		    Rectangle {
			x: -parent.height
			y: -parent.height
			z: -1
			width: parent.height * 2
			height: parent.height * 2
			color: Theme.accent
			radius: 100000
		    }

		    Rectangle {
			x: parent.width - parent.height
			y: -parent.height
			z: -1
			width: parent.height * 2
			height: parent.height * 2
			color: Theme.accent
			radius: 100000
		    }
		}
	    }

	    Item {
		height: 1000
		width: 750
	    }
	}
    }
}
