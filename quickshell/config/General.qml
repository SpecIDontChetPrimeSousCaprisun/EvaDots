pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick
import qs.services

Singleton {
    property string user: ""

    Process {
	id: usrProc
	running: true

	command: [ "whoami" ]

	stdout: StdioCollector {
	    onStreamFinished: user = text.trim()
	}

	onExited: {
	    MediaServ.startCavaProc()
	}
    }
}
