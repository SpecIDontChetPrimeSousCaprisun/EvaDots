pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    property bool launcherOpen: false

    IpcHandler {
	target: "apps"
	function openLauncher() {
	    launcherOpen = true
	}

	function closeLauncher() {
	    launcherOpen = false
	}

	function toggleLauncher() {
	    launcherOpen = !launcherOpen
	}
    }
}
