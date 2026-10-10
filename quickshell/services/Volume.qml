pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    property bool speakerMuted: false
    property bool micMuted: false
    property real speakerVolume: 0
    property real micVolume: 0

    function refresh() {
	getSpeaker.running = true
	getMic.running = true
    }

    Process {
	id: getSpeaker
	command: ["wpctl", "get-volume", "@DEFAULT_AUDIO_SINK@"]
	stdout: SplitParser {
	    onRead: data => {
		let match = data.match(/Volume:\s*([\d.]+)/)
		if (match) speakerVolume = parseFloat(match[1])
		speakerMuted = data.includes("[MUTED]")
	    }
	}
    }

    Process {
	id: getMic
	command: ["wpctl", "get-volume", "@DEFAULT_AUDIO_SOURCE@"]
	stdout: SplitParser {
	    onRead: data => {
		let match = data.match(/Volume:\s*([\d.]+)/)
		if (match) micVolume = parseFloat(match[1])
		micMuted = data.includes("[MUTED]")
	    }
	}
    }

    Process {
	id: subscribeProcess
	command: ["pactl", "subscribe"]
	running: true
	stdout: SplitParser {
	    onRead: data => {
		refresh()
	    }
	}
    }

    Component.onCompleted: refresh()
}
