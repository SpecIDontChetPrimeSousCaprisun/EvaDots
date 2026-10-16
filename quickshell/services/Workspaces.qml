pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick

Singleton {
    property var workspaces: Hyprland.workspaces

    function switchWorkspaces(index) {
	switchProc.command = [
	    "hyprctl",
	    "eval",
	    "'hl.dispatch(hl.dsp.focus({ workspace = " + '"' + index.toString() + '"' + "}))'"
	]

	switchProc.running = true
    }

    Process {
	id: switchProc
    }
}
