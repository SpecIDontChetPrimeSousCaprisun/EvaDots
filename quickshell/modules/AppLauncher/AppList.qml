import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.services

ListView {
    Layout.fillWidth: true
    Layout.fillHeight: true
    anchors.leftMargin: 2
    anchors.rightMargin: 2
    currentIndex: 0
    model: Apps.apps
    clip: true
    visible: Apps.currentDisplay === "drun"
    delegate: App {}
}
