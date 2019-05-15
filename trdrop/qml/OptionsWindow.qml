import QtQuick 2.12
import QtQml.Models 2.1
import QtQuick.Window 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

Window {
    id: optionsWindow
    title: "Options"
    visible: true
    width: 800
    height: 800
    flags: Qt.SubWindow
    Material.theme: Material.Dark
    Material.accent: Material.DeepPurple

    Pane {
        width: optionsWindow.width
        height: optionsWindow.height
        GridLayout {
            rows: 1
            columns: 2
            anchors.fill: parent
            GridLayout {
                rows: 4
                columns: 1
                Button {
                    id: generalTab
                    Layout.minimumWidth: 150
                    Layout.minimumHeight: 150
                    flat: true
                    text: "General"
                    font.pointSize: 15
                    highlighted: generalOptions.visible
                    onClicked: {
                        generalOptions.visible   = true
                        fpsOptions.visible       = false
                        tearOptions.visible      = false
                        frametimeOptions.visible = false
                    }
                }
                Button {
                    id: fpsTab
                    Layout.minimumWidth: 150
                    Layout.minimumHeight: 150
                    flat: true
                    text: "FPS"
                    font.pointSize: 15
                    highlighted: fpsOptions.visible
                    onClicked: {
                        generalOptions.visible   = false
                        fpsOptions.visible       = true
                        tearOptions.visible      = false
                        frametimeOptions.visible = false
                    }
                }
                Button {
                    id: tearTab
                    Layout.minimumWidth: 150
                    Layout.minimumHeight: 150
                    flat: true
                    text: "Tear"
                    font.pointSize: 15
                    highlighted: tearOptions.visible
                    onClicked: {
                        generalOptions.visible   = false
                        fpsOptions.visible       = false
                        tearOptions.visible      = true
                        frametimeOptions.visible = false
                    }
                }
                Button {
                    id: frametimeTab
                    Layout.minimumWidth: 150
                    Layout.minimumHeight: 150
                    flat: true
                    text: "Frametime"
                    font.pointSize: 15
                    highlighted: frametimeOptions.visible
                    onClicked: {
                        generalOptions.visible   = false
                        fpsOptions.visible       = false
                        tearOptions.visible      = false
                        frametimeOptions.visible = true
                    }
                }
            }
            Rectangle {
                id: generalOptions
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.margins: 5
                radius: 4
                border.width: 1
                border.color: "#bface3"
                color: "#404040"
                visible: true
                // general options view
                ListView {
                    id: generalOptionsView
                    anchors { fill: parent; margins: 20 }
                    spacing: 4
                    model: DelegateModel {
                        id: generalOptionsVisual
                        model: generalOptionsModel
                        delegate: generalOptionsDelegate
                    }
                }
                Component {
                    id: generalOptionsDelegate
                    CheckBox {
                        text: model.enableViewName
                        checked: model.enableViewValue
                        ToolTip.delay: 500
                        ToolTip.visible: hovered
                        ToolTip.text: model.enableViewTooltip
                        action: Action {
                            onTriggered: {
                                model.enableViewValue = !model.enableViewValue;
                                checked: model.enableViewValue
                            }
                        }
                    }
                }
            }
            Rectangle {
                id: fpsOptions
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.margins: 5
                radius: 4
                border.width: 1
                border.color: "#bface3"
                color: "#404040"
                visible: false
                // general fps view
                ListView {
                    id: fpsOptionsView
                    anchors { fill: parent; margins: 20 }
                    spacing: 4
                    model: DelegateModel {
                        id: fpsOptionsVisual
                        model: fpsOptionsModel
                        delegate: fpsOptionsDelegate
                    }
                }
                Component {
                    id: fpsOptionsDelegate
                    Frame {
                        ColumnLayout {
                            Switch {
                                text: model.option01Name
                                checked: model.option01Value
                                ToolTip.delay: 500
                                ToolTip.visible: hovered
                                //ToolTip.text: model.option01Tooltip
                                action: Action {
                                    onTriggered: {
                                        model.option01Value = !model.option01Value;
                                        checked: model.option01Value
                                    }
                                }
                            }
                            Switch {
                                text: model.option02Name
                                checked: model.option02Value
                                ToolTip.delay: 500
                                ToolTip.visible: hovered
                                //ToolTip.text: model.option02Tooltip
                                action: Action {
                                    onTriggered: {
                                        model.option02Value = !model.option02Value;
                                        checked: model.option02Value
                                    }
                                }
                            }
                            RowLayout {
                                Label {
                                    text: "Plotcolor"
                                }
                                Rectangle {
                                    id: colorView
                                    width: 50
                                    height: 20
                                    color: "#AFAFEF"
                                    border.color: "#fffafa"
                                    border.width: 1
                                    radius: 2
                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: {
                                            colorDialog.open()
                                        }
                                    }
                                    ColorDialog {
                                        id: colorDialog
                                        title: "Please choose a color"
                                        onAccepted: {
                                            colorView.color = colorDialog.color
                                        }
                                    }
                                }
                            }
                        }
                    }

                }
            }
            Rectangle {
                id: tearOptions
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.margins: 5
                radius: 4
                border.width: 1
                border.color: "#bface3"
                color: "#404040"
                visible: false
            }
            Rectangle {
                id: frametimeOptions
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.margins: 5
                radius: 4
                border.width: 1
                border.color: "#bface3"
                color: "#404040"
                visible: false
            }
        }
    }
}
