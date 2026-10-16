pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    property var lockScreenshots: ({})

    function captureAllScreens(root, callback) {
	let screens = Quickshell.screens
	let remaining = screens.length

	for (let screen of screens) {
	    let path = "/tmp/lockscreen-" + screen.name + ".png"
	    let proc = Qt.createQmlObject(
		'import Quickshell.Io; Process { command: ["grim", "-o", "' + screen.name + '", "' + path + '"] }',
		root
	    )

	    proc.onRunningChanged.connect(() => {
		if (!proc.running) {
		    lockScreenshots[screen.name] = path
		    remaining--
		    if (remaining === 0) callback()
		}
	    })
	    proc.running = true
	}
    }
}
