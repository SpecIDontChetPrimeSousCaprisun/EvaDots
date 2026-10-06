import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import qs.components
import qs.config
import qs.services
import qs.modules.Tooltip

StyledWindow {
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
	y: widget.y
	width: widget.x + widget.width
	height: widget.y + TooltipServ.botL
	hoverEnabled: true

	onExited: TooltipServ.menuVisible = false
    }

    Widget {
	id: widget
	x: 60
	y: TooltipServ.posY - height 
	width: TooltipServ.menuVisible ? 300 : 0
	height: layout.implicitHeight
	clip: true

	Behavior on width {
	    Anim {}
	}

	ColumnLayout {
	    id: layout

	    Rectangle {
		height: 40
		width: labelText.implicitWidth
		opacity: 1
		color: Theme.accent

		Text {
		    id: labelText
		    anchors.centerIn: parent
		    text: TooltipServ.type
		    color: Theme.background
		    font {
			family: Theme.font
			letterSpacing: -1
			pixelSize: 27
			weight: 1000
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
	}
    }
}
