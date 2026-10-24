pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    property bool launcherOpen: false
    property string currentDisplay: "drun"
    property string filterQuery: ""
    property var apps: {
	if (filterQuery.length === 0) return DesktopEntries.applications.values
	return DesktopEntries.applications.values.filter(app =>
	    app.name.toLowerCase().includes(filterQuery.toLowerCase())
	)
    }

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
