import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import qs.components
import qs.config
import qs.services
import qs.modules.Tooltip

StyledWindow {
    id: root
    visible: TooltipServ.menuVisible
    mask: widget

    anchors.top: true
    anchors.bottom: true
    anchors.left: true
    anchors.right: true

    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.exclusionMode: ExclusionMode.Ignore

    MouseArea {
	x: 0
	y: TooltipServ.posY + layout.implicitHeight > root.height ? TooltipServ.botL - layout.implicitHeight : 
	   TooltipServ.posY - layout.implicitHeight / 2
	width: 360
	height: TooltipServ.botL - y
	hoverEnabled: true

	onExited: { 
	    TooltipServ.menuVisible = false
	}

	onPositionChanged: {
	    for (let i = 0; i < TooltipServ.buttonPoses.length; i++) {
		let topLeft = TooltipServ.buttonPoses[i].topLeft

		console.log(topLeft.x, TooltipServ.topLeft.x)
		if (TooltipServ.buttonPoses[i].type === TooltipServ.type) return;

		let mouseX = this.mapToItem(null, 0, 0).x + mouse.x
		let mouseY = this.mapToItem(null, 0, 0).y + mouse.y

		if (topLeft.x <= mouseX &&
		    topLeft.x + TooltipServ.buttonPoses[i].width >= mouseX &&
		    topLeft.y <= mouseY &&
		    topLeft.y + TooltipServ.buttonPoses[i].height >= mouseY) {
			TooltipServ.menuVisible = false
			break
		}
	    }
	}

	Widget {
	    id: widget
	    x: 60
	    width: TooltipServ.menuVisible ? layout.implicitWidth < 300 ? 300 : layout.implicitWidth : 0
	    height: layout.implicitHeight
	    clip: true

	    Behavior on width {
		Anim {}
	    }

	    ColumnLayout {
		id: layout
		anchors.fill: parent

		Rectangle {
		    height: 40
		    width: labelText.implicitWidth
		    opacity: 1
		    color: Theme.accent

		    Text {
			id: labelText
			anchors.fill: parent
			text: TooltipServ.type
			color: Theme.background
			font {
			    family: Theme.font
			    letterSpacing: -1
			    pixelSize: 27
			    weight: 600
			}
		    }

		    Item {
			anchors.left: parent.right
			height: parent.height
			width: 100
			clip: true

			Rectangle {
			    height: parent.height * 2
			    width: 100
			    radius: 100
			    opacity: 1
			    color: Theme.accent
			    z: -1
			    x: -width / 2
			    y: -height / 2
			}
		    }
		}

		Power {}
		Media {}
	    }
	}
    }
}
