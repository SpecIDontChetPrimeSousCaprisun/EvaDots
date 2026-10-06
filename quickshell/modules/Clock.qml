import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config

Item {
    Layout.fillWidth: true
    implicitHeight: text.implicitHeight

    Text {
	id: text
	anchors.centerIn: parent
	text: Qt.formatDateTime(clock.date, "hh\nmm");
	color: Theme.accent
	font {
	    family: Theme.font
	    letterSpacing: -1
	    pixelSize: 17
	    weight: 600
	}
    }

    SystemClock {
	id: clock
	precision: SystemClock.minutes
    }
}
