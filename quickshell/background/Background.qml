import Quickshell
import Quickshell.Wayland
import QtQuick
import qs.components
import qs.config

Variants {
    model: Quickshell.screens

    StyledWindow {
	id: win

	required property ShellScreen modelData

	screen: modelData
	name: "background"
	WlrLayershell.exclusionMode: ExclusionMode.Ignore
	WlrLayershell.layer: WlrLayer.Bottom

	anchors.top: true
        anchors.bottom: true
        anchors.left: true
	anchors.right: true

	SystemClock {
	    id: clock
	    precision: SystemClock.minutes
	}

	Text {
	    x: modelData.width / 2 - width / 2
	    y: modelData.height / 7
	    text: Qt.formatDateTime(clock.date, "hh:mm")
	    color: Theme.accent
	    font {
	      family: "Jetbrains Mono Nerd"
	      letterSpacing: -1
	      pixelSize: 70
	      weight: 600
	    }
	}
    }
}
