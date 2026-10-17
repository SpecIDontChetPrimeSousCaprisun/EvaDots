import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services

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

	MouseArea {
	    anchors.fill: parent
	    onClicked: {
		DashboardServ.dashboardVisible = !DashboardServ.dashboardVisible 
	    }
	}
    }

    SystemClock {
	id: clock
	precision: SystemClock.minutes
    }
}
