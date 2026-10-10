import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services

Item {
    Layout.fillWidth: true
    implicitHeight: rectangle.implicitHeight

    Rectangle {
	id: rectangle
	anchors.centerIn: parent
	implicitWidth: (parent.width / 5) * 3
	implicitHeight: layout.implicitHeight + 10
	radius: 10
	color: Theme.secondary

	ColumnLayout {
	    id: layout
	    anchors.centerIn: parent
	    Repeater {
		model: Workspaces.workspaces

		Rectangle {
		    required property var modelData

		    width: 10
		    height: 10
		    radius: 100
		    color: modelData.focused ? Theme.workspaceSelected : Theme.workspace
		}
	    }
	}
    }
}
