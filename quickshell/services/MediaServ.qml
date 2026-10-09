pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris
import QtQuick

Item {
    readonly property list<MprisPlayer> list: Mpris.players.values
    property MprisPlayer player: list[0]

    /*Timer {
	interval: 100
	running: true
	repeat: true
	onTriggered: {
	    console.log("a")
	    console.log(Mpris.players.values[0])
	}
    }*/
}
