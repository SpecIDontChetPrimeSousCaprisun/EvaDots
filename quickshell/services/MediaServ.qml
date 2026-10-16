pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris
import QtQuick
import qs.config

Item {
    readonly property list<MprisPlayer> list: Mpris.players.values
    property MprisPlayer player: list[0]
    property var bars: []

    function startCavaProc() {
	cavaProcess.command = ["cava", "-p", "/home/" + General.user + "/.config/quickshell/helpers/cava/config.conf"]
	cavaProcess.running = true
    }

    Process {
	id: cavaProcess
	command: ["cava", "-p", "/home/" + General.user + "/.config/quickshell/helpers/cava/config.conf"]

	stdout: SplitParser {
	    onRead: data => {
		let values = data.split(";").filter(v => v.length > 0).map(v => parseInt(v))
		bars = values
	    }
	}
    }
}
