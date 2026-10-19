import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.services
import qs.config
import qs.components

Rectangle {
    width: parent.width
    height: parent.width / 3
    anchors.bottom: parent.bottom
    gradient: Gradient {
	orientation: Gradient.Vertical
	GradientStop { position: 1.0; color: Theme.secondary }
	GradientStop { position: 0.0; color: "transparent" }
    }

    RowLayout {
	id: layout
	anchors.fill: parent
	spacing: 3

	Repeater {
	    model: MediaServ.bars

	    delegate: Rectangle {
		required property var modelData

		width: 15
		height: Math.max(2, (modelData / 100) * layout.height)
		color: Theme.accent
		radius: 6
		Layout.alignment: Qt.AlignBottom

		Behavior on height {
		    Anim {}
		}
	    }
	}

	Component.onCompleted: {
	    console.log(height)
	}
    }
}
