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
    }
}
