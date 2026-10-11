pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    property string user: ""

    Process {
	id: usrProc

	command: [ "whoami" ]

	stdout: StdioCollector {
	    onStreamFinished: user = text.trim()
	}
    }

    Component.onCompleted: {
	usrProc.running = true
    }
}
