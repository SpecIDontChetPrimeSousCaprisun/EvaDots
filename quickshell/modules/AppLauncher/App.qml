import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services

Rectangle {
    required property var modelData

    function launch() {
	let cmd = modelData.command

	if (modelData.runInTerminal) cmd = ["kitty", ...cmd]

	Quickshell.execDetached(cmd)
	Apps.launcherOpen = false
    }

    width: parent.width
    height: 50
    color: ListView.isCurrentItem ? Theme.bgSecondary : Theme.background

    MouseArea {
	anchors.fill: parent
	hoverEnabled: true
	onEntered: parent.hovered = true
	onExited: parent.hovered = false
	onClicked: launch()
    }

    RowLayout {
	anchors.fill: parent
	anchors.leftMargin: 5

	IconImage {
	    source: Quickshell.iconPath(modelData.icon)
	    width: 40
	    height: 40
	}

	Text {
	    text: modelData.name
	    color: Theme.accent
	    Layout.fillWidth: true
	    Layout.fillHeight: true
	    verticalAlignment: Text.AlignVCenter

	    font {
		family: Theme.font
		letterSpacing: -1
		pixelSize: 15
		weight: 600
	    }
	}
    }
}
