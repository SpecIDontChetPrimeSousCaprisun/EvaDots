import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import qs.components
import qs.config
import qs.modules.AppLauncher
import qs.services

StyledWindow {
    id: win

    required property ShellScreen modelData

    name: "background"
    visible: Apps.launcherOpen
    WlrLayershell.exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.OnDemand

    anchors.top: true
    anchors.bottom: true
    anchors.left: true
    anchors.right: true

    Widget {
	width: 500
	height: 750
	anchors.centerIn: parent

	ColumnLayout {
	    id: layout
	    anchors.fill: parent

	    Label {}
	    SearchBar {}
	    AppList {}
	}
    }
}
