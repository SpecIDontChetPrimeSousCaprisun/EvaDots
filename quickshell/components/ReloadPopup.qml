import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config

Scope {
    id: root

    property bool failed
    property string errorString

    Connections {
	target: Quickshell

	function onReloadCompleted() {
	    Quickshell.inhibitReloadPopup();
	    root.failed = false;
	    popupLoader.loading = true;
	}

	function onReloadFailed(error: string) {
	    Quickshell.inhibitReloadPopup();
	    popupLoader.active = false;

	    root.failed = true;
	    root.errorString = error;
	    popupLoader.loading = true;
	}
    }

    LazyLoader {
	id: popupLoader

	StyledWindow {
	    name: "Reload popup"

	    anchors.top: true
	    anchors.left: true

	    margins.top: 25
	    margins.left: 25

	    width: widget.width
	    height: widget.height

	    Widget {
		id: widget

		implicitHeight: layout.implicitHeight + 50
		implicitWidth: layout.implicitWidth + 30

		MouseArea {
		    anchors.fill: parent
		    onClicked: popupLoader.active = false

		    hoverEnabled: true
		}

		ColumnLayout {
		    id: layout
		    anchors {
			top: parent.top
			topMargin: 20
			horizontalCenter: parent.horizontalCenter
		    }

		    Text {
			text: root.failed ? "Reload failed." : "Reload completed!"
			color: Theme.accent

			font {
			    family: Theme.font
			    weight: 600
			    letterSpacing: -1
			    pixelSize: 15
			}
		    }

		    Text {
			text: root.errorString
			color: Theme.accent
			visible: root.errorString != ""

			font {
			    family: Theme.font
			    weight: 600
			    letterSpacing: -1
			    pixelSize: 15
			}
		    }
		}

		Rectangle {
		    id: bar
		    color: Theme.secondary
		    anchors.bottom: parent.bottom
		    anchors.left: parent.left
		    height: 5

		    PropertyAnimation {
			id: anim
			target: bar
			property: "width"
			from: widget.width
			to: 0
			duration: failed ? 10000 : 8000
			onFinished: popupLoader.active = false

			paused: mouseArea.containsMouse
		    }
		}

		Component.onCompleted: anim.start()
	    }
	}
    }
}
