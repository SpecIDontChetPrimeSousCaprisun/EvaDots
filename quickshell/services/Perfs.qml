pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    property real previousTotal: 0
    property real previousIdle: 0
    property real cpu: 0.0
    property real ram: 0.0
    property real gpu: 0.0
    property real power: 0.0
    property real powerFull: 0.0

    Timer {
	interval: 1000
	running: true
	repeat: true
	triggeredOnStart: true

	onTriggered: {
	    cpuProc.running = true
	    ramProc.running = true
	    gpuProc.running = true
	    powProc.running = true
	    powMaxProc.running = true
	}
    }

    Process {
	id: cpuProc
	command: [
	    "sh", "-c",
	    "awk '/^cpu / {print $2,$3,$4,$5,$6,$7,$8}' /proc/stat"
	]

	stdout: StdioCollector {
	    onStreamFinished: {
		let values = text.trim().split(" ").map(Number)

		let idle = values[3] + values[4]
		let total = values.reduce((a, b) => a + b, 0)

		if (previousTotal > 0) {
		  let totalDelta = total - previousTotal
		  let idleDelta = idle - previousIdle

		  cpu = (1 - idleDelta / totalDelta) * 100
		}

		previousTotal = total
		previousIdle = idle
	    }
	}
    }

    Process {
	id: ramProc

	command: [
	    "sh", "-c",
	    "free | awk '/Mem:/ {print $3/$2 * 100}'"
	]

	stdout: StdioCollector {
	    onStreamFinished: {
		ram = parseFloat(text.trim())
	    }
	}
    }

    Process {
	id: gpuProc

	command: [
	    "nvidia-smi",
	    "--query-gpu=utilization.gpu,temperature.gpu",
	    "--format=csv,noheader,nounits"
	]

	stdout: StdioCollector {
	    onStreamFinished: {
		let values = text.trim().split(",")

		if (values.length >= 2) {
		    gpu = parseFloat(values[1])
		}
	    }
	}
    }

    Process {
	id: powProc

	command: [
	    "cat",
	    "/sys/class/power_supply/BAT1/energy_now"
	]

	stdout: StdioCollector {
	    onStreamFinished: {
		power = parseFloat(text.trim())
		console.log(text.trim())
	    }
	}
    }

    Process {
	id: powMaxProc

	command: [
	    "cat",
	    "/sys/class/power_supply/BAT1/energy_full"
	]

	stdout: StdioCollector {
	    onStreamFinished: {
		powerFull = parseFloat(text.trim())
		console.log(text.trim())
	    }
	}
    }
}
