import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris
import QtQuick
import QtQuick.Layouts
import qs.services
import qs.config
import qs.components

Item {
    id: root

    visible: TooltipServ.type === "Media"
    Layout.fillWidth: true
    implicitHeight: layout.implicitHeight

    ColumnLayout {
	id: layout
	anchors.fill: parent
	anchors.leftMargin: 5
	anchors.rightMargin: 5

	Rectangle {
	    property bool opened: false

	    id: idRect
	    implicitWidth: idLayout.implicitWidth + 10
	    implicitHeight: idLayout.implicitHeight + 5
	    color: Theme.secondary
	    radius: 10

	    Behavior on implicitWidth {
		Anim {}
	    }

	    Behavior on implicitHeight {
		Anim {}
	    }

	    MouseArea {
		anchors.fill: parent
		onClicked: {
		    if (idRect.opened) return;

		    idRect.opened = true
		}
	    }

	    ColumnLayout {
		id: idLayout
		anchors.fill: parent
		anchors.leftMargin: 5
		anchors.rightMargin: 5

		Repeater {
		    model: MediaServ.list

		    Text {
			required property var modelData

			visible: modelData == MediaServ.player || idRect.opened
			text: modelData.identity
			horizontalAlignment: Text.AlignHCenter
			verticalAlignment: Text.AlignVCenter
			color: Theme.background
			font {
			    family: Theme.font
			    letterSpacing: -1
			    pixelSize: 15
			    weight: 600
			}

			MouseArea {
			    enabled: idRect.opened
			    anchors.fill: parent
			    onClicked: {
				MediaServ.player = parent.modelData
				idRect.opened = false
			    }
			}
		    }
		}
	    }
	}

	Item { height: 2.5 }

	Text {
	    text: MediaServ.player.trackTitle || "Nothing playing"
	    color: Theme.accent
	    Layout.fillWidth: true
	    font {
		family: Theme.font
		letterSpacing: -1
		pixelSize: 20
		weight: 600
	    }
	}

	Text {
	    text: (MediaServ.player.trackArtist || "Anonimous") + " - " + (MediaServ.player.trackAlbum || "Unknown album")
	    color: Theme.secondary
	    Layout.fillWidth: true
	    font {
		family: Theme.font
		letterSpacing: -1
		pixelSize: 15
		weight: 600
	    }
	}

	Rectangle {
	    Layout.fillWidth: true
	    height: 5
	    radius: 100
	    color: Theme.bgSecondary
	    clip: true

	    Rectangle {
		height: parent.height
		width: parent.width - (parent.width * (MediaServ.player.position / MediaServ.player.length))
		color: Theme.accent
		radius: 100
	    }
	}

	RowLayout {
	    Layout.fillWidth: true

	    Item { Layout.fillWidth: true }

	    Text {
		visible: MediaServ.player.shuffleSupported
		text: ""
		color: MediaServ.player.shuffle ? Theme.secondary : Theme.accent
		font {
		    family: Theme.font
		    pixelSize: 17
		    weight: 600
		}

		MouseArea {
		    anchors.fill: parent
		    onClicked: {
			MediaServ.player.shuffle = !MediaServ.player.shuffle
		    }
		}
	    }

	    Text {
		visible: MediaServ.player.canGoPrevious
		text: "󰒮"
		color: Theme.accent
		font {
		    family: Theme.font
		    pixelSize: 25
		    weight: 600
		}

		MouseArea {
		    anchors.fill: parent
		    onClicked: {
			MediaServ.player.previous()
		    }
		}
	    }

	    Rectangle {
		id: playRectangle
		implicitWidth: playText.implicitHeight 
		implicitHeight: playText.implicitHeight 
		color: Theme.accent
		radius: 100

		Text {
		    anchors.centerIn: parent

		    id: playText
		    text: MediaServ.player.isPlaying ? "" : ""
		    color: Theme.background
		    font {
			family: Theme.font
			pixelSize: 25
			weight: 600
		    }
		}

		MouseArea {
		    enabled: MediaServ.player.canPlay && MediaServ.player.canPause
		    anchors.fill: parent
		    onClicked: {
			if (MediaServ.player.isPlaying) {
			    MediaServ.player.pause()
			} else {
			    MediaServ.player.play()
			}
		    }
		}
	    }

	    Text {
		visible: MediaServ.player.canGoNext
		text: "󰒭"
		color: Theme.accent
		font {
		    family: Theme.font
		    pixelSize: 25
		    weight: 600
		}

		MouseArea {
		    anchors.fill: parent
		    onClicked: {
			MediaServ.player.next()
		    }
		}
	    }

	    Text {
		visible: MediaServ.player.loopSupported
		text: ""
		color: MediaServ.player.loopState != MprisLoopState.None ? Theme.secondary : Theme.accent
		font {
		    family: Theme.font
		    pixelSize: 17
		    weight: 600
		}

		MouseArea {
		    anchors.fill: parent
		    onClicked: {
			if (MediaServ.player.loopState === MprisLoopState.None) MediaServ.player.loopState = MprisLoopState.Playlist;
			else MediaServ.player.loopState = MprisLoopState.None;
		    }
		}
	    }

	    Item { Layout.fillWidth: true }
	}

	Item { height: 2.5}
    }
}
