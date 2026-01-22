import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    enabled: AppState.widgetsEnabled
    
    ScrollView {
        anchors.fill: parent
        anchors.margins: 16
        contentWidth: availableWidth
        
        ColumnLayout {
            width: parent.width
            spacing: 12

            // Scroll Bar Policy Controls
            GroupBox {
                Layout.fillWidth: true
                title: "Scroll Bar Policy"
                Accessible.name: "Scroll Bar Policy Group"
                Accessible.role: Accessible.Grouping
                
                RowLayout {
                    spacing: 12
                    
                    Label { 
                        text: "Vertical:" 
                        Accessible.name: "Vertical Label"
                        Accessible.role: Accessible.StaticText
                    }
                    ComboBox {
                        id: verticalPolicyCombo
                        objectName: "verticalPolicyCombo"
                        model: ["As Needed", "Always Off", "Always On"]
                        currentIndex: 0
                        Accessible.name: "Vertical Scroll Policy"
                        Accessible.role: Accessible.ComboBox
                    }
                    
                    Label { 
                        text: "Horizontal:" 
                        Accessible.name: "Horizontal Label"
                        Accessible.role: Accessible.StaticText
                    }
                    ComboBox {
                        id: horizontalPolicyCombo
                        objectName: "horizontalPolicyCombo"
                        model: ["As Needed", "Always Off", "Always On"]
                        currentIndex: 0
                        Accessible.name: "Horizontal Scroll Policy"
                        Accessible.role: Accessible.ComboBox
                    }
                    
                    Item { Layout.fillWidth: true } // Spacer
                }
            }

            // Two ListViews side by side
            GroupBox {
                Layout.fillWidth: true
                Layout.fillHeight: true
                title: "ListViews"
                Accessible.name: "ListViews Group"
                Accessible.role: Accessible.Grouping
                
                RowLayout {
                    anchors.fill: parent
                    spacing: 12
                    
                    // Left ListView
                    Frame {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.minimumHeight: 500
                        
                        ScrollView {
                            id: leftScrollView
                            anchors.fill: parent
                            
                            ScrollBar.vertical.policy: getScrollBarPolicy(verticalPolicyCombo.currentIndex)
                            ScrollBar.horizontal.policy: getScrollBarPolicy(horizontalPolicyCombo.currentIndex)
                            
                            ListView {
                                id: leftListView
                                objectName: "leftListView"
                                model: ListModel {
                                    id: leftModel
                                    Component.onCompleted: {
                                        for (var i = 0; i < 15; i++) {
                                            append({"itemText": "👍 Item " + i})
                                        }
                                    }
                                }
                                delegate: ItemDelegate {
                                    text: modelData || itemText
                                    width: leftListView.width
                                    objectName: "leftListItem_" + index
                                    Accessible.name: text
                                    Accessible.role: Accessible.ListItem
                                }
                                Accessible.name: "Left ListView"
                                Accessible.role: Accessible.List
                            }
                        }
                    }
                    
                    // Right ListView
                    Frame {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.minimumHeight: 300
                        
                        ScrollView {
                            id: rightScrollView
                            anchors.fill: parent
                            
                            ScrollBar.vertical.policy: getScrollBarPolicy(verticalPolicyCombo.currentIndex)
                            ScrollBar.horizontal.policy: getScrollBarPolicy(horizontalPolicyCombo.currentIndex)
                            
                            ListView {
                                id: rightListView
                                objectName: "rightListView"
                                model: ["Lorem", "ipsum", "dolor", "sit", "amet", "consectetur", "adipiscing", "elit"]
                                delegate: ItemDelegate {
                                    text: modelData
                                    width: rightListView.width
                                    objectName: "rightListItem_" + index
                                    Accessible.name: text
                                    Accessible.role: Accessible.ListItem
                                }
                                Accessible.name: "Right ListView"
                                Accessible.role: Accessible.List
                            }
                        }
                    }
                }
            }
        }
    }

    // Helper function to convert combo index to ScrollBar policy
    function getScrollBarPolicy(index) {
        switch(index) {
            case 0: return ScrollBar.AsNeeded
            case 1: return ScrollBar.AlwaysOff
            case 2: return ScrollBar.AlwaysOn
            default: return ScrollBar.AsNeeded
        }
    }
}
