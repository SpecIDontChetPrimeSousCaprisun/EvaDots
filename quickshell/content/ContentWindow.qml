import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import qs.components
import qs.config
import qs.modules

Variants {
    model: Quickshell.screens

    StyledWindow {
	required property ShellScreen modelData

	name: "content"
	screen: modelData

	WlrLayershell.layer: WlrLayer.Top

	anchors.top: true
	anchors.bottom: true
	anchors.left: true

	implicitWidth: 50

	Widget {
	    id: background

	    anchors.leftMargin: 6
	    anchors.topMargin: 6
	    anchors.bottomMargin: 6
	    anchors.fill: parent
	    opacity: 1


	    ColumnLayout {
		anchors.fill: parent

		Rectangle {
		    Layout.fillWidth: true
		    height: topLayout.implicitHeight
		    opacity: 1
		    color: Theme.accent

		    ColumnLayout {
			id: topLayout
			anchors.fill: parent
		    }

		    Item {
			anchors.top: parent.bottom
			width: parent.width
			height: 100
			clip: true

			Rectangle {
			    width: parent.width * 2
			    height: 100
			    radius: 100
			    color: Theme.accent
			    z: -1
			    y: -height / 2
			}
		    }
		}

		Item {
		    Layout.fillHeight: true
		}

		Clock {}

		Item {
		    Layout.fillHeight: true
		}

		Rectangle {
		    Layout.fillWidth: true
		    implicitHeight: bottomLayout.implicitHeight
		    color: Theme.accent

		    ColumnLayout {
			id: bottomLayout
			anchors.fill: parent

			PowerButton {}
		    }

		    Item {
			anchors.bottom: parent.top
			width: parent.width
			height: 100
			clip: true

			Rectangle {
			    width: parent.width * 2
			    height: 100
			    radius: 100
			    color: Theme.accent
			    z: -1
			    y: height / 2
			    x: -width / 2
			}
		    }
		}
	    }

	    MultiEffect {
		anchors.fill: parent
		blur: 30
	    }
	}
    }
}
