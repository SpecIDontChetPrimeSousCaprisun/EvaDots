import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.components

Item {
    WlSessionLock {
	id: lock

	WlSessionLockSurface {
	    Text {
		text: "unlock"
		
		MouseArea {
		    anchors.fill: parent
		    onClicked: lock.locked = false
		}
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
	    lock.locked = true
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

		console.log(result)

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
