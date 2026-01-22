import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ".."

Item {
    enabled: AppState.widgetsEnabled
    property bool isReadonly: AppState.widgetsReadonly
    
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 0
        
        TabBar {
            id: tabBar
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            Layout.bottomMargin: -1
            spacing: 4
            
            background: Rectangle {
                color: "transparent"
                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: 1
                    color: Theme.border
                }
            }
            
            TabButton {
                id: tab1
                objectName: "tab1"
                text: "With Word Wrap"
                height: 36
                width: implicitWidth + 24
                Accessible.name: "With Word Wrap Tab"
                Accessible.role: Accessible.PageTab
                
                contentItem: Text {
                    text: tab1.text
                    font.pixelSize: Theme.fontSizeBody
                    font.weight: tab1.checked ? Font.Medium : Font.Normal
                    color: tab1.checked ? Theme.primary : Theme.textSecondary
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                
                background: Rectangle {
                    color: tab1.checked ? Theme.surface : (tab1.hovered ? Qt.rgba(Theme.primary.r, Theme.primary.g, Theme.primary.b, 0.05) : "transparent")
                    border.color: tab1.checked ? Theme.border : Theme.border
                    border.width: 1
                    radius: 4
                    
                    // Hide bottom border for active tab to connect with content
                    Rectangle {
                        visible: tab1.checked
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 1
                        height: 3
                        color: Theme.surface
                    }
                    
                    // Primary indicator at bottom
                    Rectangle {
                        visible: tab1.checked
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width - 16
                        height: 3
                        color: Theme.primary
                    }
                    
                    Behavior on color {
                        ColorAnimation { duration: Theme.animationDuration }
                    }
                }
            }
            
            TabButton {
                id: tab2
                objectName: "tab2"
                text: "No Word Wrap"
                height: 36
                width: implicitWidth + 24
                Accessible.name: "No Word Wrap Tab"
                Accessible.role: Accessible.PageTab
                
                contentItem: Text {
                    text: tab2.text
                    font.pixelSize: Theme.fontSizeBody
                    font.weight: tab2.checked ? Font.Medium : Font.Normal
                    color: tab2.checked ? Theme.primary : Theme.textSecondary
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                
                background: Rectangle {
                    color: tab2.checked ? Theme.surface : (tab2.hovered ? Qt.rgba(Theme.primary.r, Theme.primary.g, Theme.primary.b, 0.05) : "transparent")
                    border.color: tab2.checked ? Theme.border : Theme.border
                    border.width: 1
                    radius: 4
                    
                    // Hide bottom border for active tab to connect with content
                    Rectangle {
                        visible: tab2.checked
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 1
                        height: 3
                        color: Theme.surface
                    }
                    
                    // Primary indicator at bottom
                    Rectangle {
                        visible: tab2.checked
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width - 16
                        height: 3
                        color: Theme.primary
                    }
                    
                    Behavior on color {
                        ColorAnimation { duration: Theme.animationDuration }
                    }
                }
            }
        }
        
        StackLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            currentIndex: tabBar.currentIndex
            
            // Tab 1: TextEdit with Word Wrap
            Rectangle {
                color: Theme.surface
                border.color: Theme.border
                border.width: 1
                radius: 4
                
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 8
                    
                    ScrollView {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        
                        TextArea {
                            id: wrapTextEdit
                            objectName: "wrapTextEdit"
                            text: "This is a TextEdit widget that allows for editing text spanning multiple paragraphs.\n\nThis line starts in a new paragraph."
                            wrapMode: TextEdit.WordWrap
                            selectByMouse: true
                            selectByKeyboard: true
                            readOnly: isReadonly
                            
                            Accessible.name: "Text Edit with Word Wrap"
                            Accessible.role: Accessible.EditableText
                            
                            onTextChanged: {
                                if (activeFocus) {
                                    AppState.setStatus("Text edited (With Wrap): " + text.length + " chars")
                                }
                            }
                            
                            Menu {
                                id: contextMenu
                                MenuItem { 
                                    text: "Cut"
                                    enabled: wrapTextEdit.selectedText.length > 0
                                    onTriggered: wrapTextEdit.cut()
                                }
                                MenuItem { 
                                    text: "Copy"
                                    enabled: wrapTextEdit.selectedText.length > 0
                                    onTriggered: wrapTextEdit.copy()
                                }
                                MenuItem { 
                                    text: "Paste"
                                    onTriggered: wrapTextEdit.paste()
                                }
                                MenuSeparator {}
                                MenuItem { 
                                    text: "Select All"
                                    onTriggered: wrapTextEdit.selectAll()
                                }
                            }
                            
                            MouseArea {
                                anchors.fill: parent
                                acceptedButtons: Qt.RightButton
                                onClicked: contextMenu.popup()
                            }
                        }
                    }
                    
                    Label {
                        text: "Characters: " + wrapTextEdit.text.length
                        font.pixelSize: 11
                        color: palette.mid
                        Accessible.name: "Character count: " + wrapTextEdit.text.length
                        Accessible.role: Accessible.StaticText
                    }
                }
            }
            
            // Tab 2: TextEdit without Word Wrap
            Rectangle {
                color: Theme.surface
                border.color: Theme.border
                border.width: 1
                radius: 4
                
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 8
                    
                    ScrollView {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        
                        TextArea {
                            id: nowrapTextEdit
                            objectName: "nowrapTextEdit"
                            text: "This is our TextEdit widget (No-Wrap). ".repeat(6)
                            wrapMode: TextEdit.NoWrap
                            selectByMouse: true
                            selectByKeyboard: true
                            readOnly: isReadonly
                            
                            Accessible.name: "Text Edit without Word Wrap"
                            Accessible.role: Accessible.EditableText
                            
                            onTextChanged: {
                                if (activeFocus) {
                                    AppState.setStatus("Text edited (No Wrap): " + text.length + " chars")
                                }
                            }
                            
                            Menu {
                                id: contextMenu2
                                MenuItem { 
                                    text: "Cut"
                                    enabled: nowrapTextEdit.selectedText.length > 0
                                    onTriggered: nowrapTextEdit.cut()
                                }
                                MenuItem { 
                                    text: "Copy"
                                    enabled: nowrapTextEdit.selectedText.length > 0
                                    onTriggered: nowrapTextEdit.copy()
                                }
                                MenuItem { 
                                    text: "Paste"
                                    onTriggered: nowrapTextEdit.paste()
                                }
                                MenuSeparator {}
                                MenuItem { 
                                    text: "Select All"
                                    onTriggered: nowrapTextEdit.selectAll()
                                }
                            }
                            
                            MouseArea {
                                anchors.fill: parent
                                acceptedButtons: Qt.RightButton
                                onClicked: contextMenu2.popup()
                            }
                        }
                    }
                    
                    Label {
                        text: "Characters: " + nowrapTextEdit.text.length
                        font.pixelSize: 11
                        color: palette.mid
                        Accessible.name: "Character count: " + nowrapTextEdit.text.length
                        Accessible.role: Accessible.StaticText
                    }
                }
            }
        }
        
        // Info Panel
        GroupBox {
            Layout.fillWidth: true
            title: "Info"
            Layout.topMargin: 8
            Accessible.name: "Info Group"
            Accessible.role: Accessible.Grouping
            
            ColumnLayout {
                anchors.fill: parent
                spacing: 6
                Label {
                    text: "• Tab 1: Word wrap enabled (wraps at widget width)"
                    Accessible.name: "Tab 1: Word wrap enabled"
                    Accessible.role: Accessible.StaticText
                }
                Label {
                    text: "• Tab 2: No word wrap (horizontal scrolling enabled)"
                    Accessible.name: "Tab 2: No word wrap"
                    Accessible.role: Accessible.StaticText
                }
                Label {
                    text: "• Right-click for context menu (Cut, Copy, Paste, Select All)"
                    Accessible.name: "Right-click for context menu"
                    Accessible.role: Accessible.StaticText
                }
            }
        }
        
        Item { Layout.fillHeight: true } // Stretch
    }
}
