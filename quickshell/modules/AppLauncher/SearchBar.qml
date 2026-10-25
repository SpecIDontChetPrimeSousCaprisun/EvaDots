import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services

Rectangle {
    Layout.fillWidth: true
    color: Theme.bgSecondary
    height: 30

    TextInput {
	anchors.fill: parent
	color: Theme.accent
	focus: true
	onTextChanged: Apps.filterQuery = text

	Keys.onReturnPressed: {
	    appList.currentItem.launch()
	}

	Keys.onEscapePressed: {
	    Apps.launcherOpen = false
	}

	Keys.onUpPressed: {
	    appList.currentIndex = Math.max(appList.currentIndex - 1, 0)
	}

	Keys.onDownPressed: {
	    appList.currentIndex = Math.min(appList.currentIndex + 1, appList.count - 1)
	}
    }
}
