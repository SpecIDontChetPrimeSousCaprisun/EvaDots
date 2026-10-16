import Quickshell
import QtQuick
import qs.services

Image {
    required property ShellScreen screen

    anchors.fill: parent
    source: "file://" + LockBg.lockScreenshots[screen.name]
    fillMode: Image.PreserveAspectCrop
    cache: false
    visible: false
}
