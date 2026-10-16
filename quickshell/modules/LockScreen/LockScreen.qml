import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import qs.config
import qs.modules
import qs.components
import qs.services

Item {
    id: root

    WlSessionLock {
	id: lock

	WlSessionLockSurface {
	    id: surface

	    LockBackground {
		anchors.fill: parent
		screen: surface.screen
		id: bgImage

		AudioVisualiser {
		}
	    }

	    MultiEffect {
		anchors.fill: bgImage
		source: bgImage
		blurEnabled: true
		blur: 1.0
		blurMax: 64
	    }

	    Widget {
		width: 200
		height: 40
		anchors.centerIn: parent

		TextInput {
		    anchors.fill: parent
		    color: Theme.accent
		    echoMode: TextInput.Password
		    focus: true
		    horizontalAlignment: TextInput.AlignHCenter
		    verticalAlignment: TextInput.AlignVCenter

		    font {
			family: Theme.font
			letterSpacing: 2
			pixelSize: 27
			weight: 600
		    }

		    Component.onCompleted: {
			forceActiveFocus()
		    }

		    onAccepted: {
			auth(text)
			text = ""
		    }
		}
	    }
	}
    }

    IpcHandler {
	target: "lock"
	function lock(): void {
	    LockBg.captureAllScreens(root, () => {
		lock.locked = true
	    })
	}
    }

    function auth(passwd) {
	if (passwd.length === 0) return

	pamHelper.running = true
	pamHelper.write(passwd + "\n")
    }

    Process {
	id: pamHelper

	stdinEnabled: true
	command: ["/home/" + General.user + "/.config/quickshell/helpers/pam/helper"]

	stdout: StdioCollector {
	    onStreamFinished: {
		const result = text.trim()

		if (result === "OK") {
		    lock.locked = false
		}
	    }
	}

	onExited: {
	    console.log("PAM helper exited:", exitCode)
	}
    }
}
