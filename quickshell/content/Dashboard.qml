import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.components
import qs.services
import qs.modules
import qs.modules.Dashboard

StyledWindow {
    name: "Dashboard"

    visible: DashboardServ.dashboardVisible
    anchors.top: true
    anchors.left: true
    anchors.right: true
    anchors.bottom: true

    Widget {
	anchors.centerIn: parent
	
	Updater {}
    }

    AudioVisualiser {}
}
