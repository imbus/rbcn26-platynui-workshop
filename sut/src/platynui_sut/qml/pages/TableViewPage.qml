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

            // Filter Controls
            GroupBox {
                Layout.fillWidth: true
                title: "Filter"
                Accessible.name: "Filter Group"
                Accessible.role: Accessible.Grouping
                
                RowLayout {
                    spacing: 12
                    
                    Label { 
                        text: "Filter by Header 1:" 
                        Accessible.name: "Filter by Header 1 Label"
                        Accessible.role: Accessible.StaticText
                    }
                    TextField {
                        id: filterField
                        objectName: "filterTextField"
                        placeholderText: "Enter filter text"
                        Layout.preferredWidth: 250
                        Accessible.name: "Filter by Header 1"
                        Accessible.role: Accessible.EditableText
                        onTextChanged: tableModel.filterText = text
                    }
                    
                    Item { Layout.fillWidth: true } // Spacer
                }
            }

            // TableView
            GroupBox {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.minimumHeight: 400
                title: "Table"
                Accessible.name: "Table Group"
                Accessible.role: Accessible.Grouping
                
                ColumnLayout {
                    anchors.fill: parent
                    spacing: 0
                    
                    // Header Row
                    Rectangle {
                        Layout.fillWidth: true
                        height: 40
                        color: palette.button
                        
                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 1
                            spacing: 1
                            
                            Repeater {
                                model: ["Header 1", "Header 2", "Header 3", "Header 4"]
                                
                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    color: palette.button
                                    
                                    Label {
                                        anchors.centerIn: parent
                                        text: modelData
                                        font.bold: true
                                        Accessible.name: modelData
                                        Accessible.role: Accessible.ColumnHeader
                                    }
                                    
                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {
                                            tableModel.sortByColumn(index)
                                            AppState.setStatus("Sorted by " + modelData)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    // Table Content with ScrollView
                    ScrollView {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        
                        ListView {
                            id: tableListView
                            objectName: "tableView"
                            clip: true
                            
                            model: ListModel {
                                id: tableModel
                                
                                property string filterText: ""
                                property int sortColumn: -1
                                property bool sortAscending: true
                                
                                Component.onCompleted: {
                                    // Create table data
                                    for (var r = 1; r <= 11; r++) {
                                        append({
                                            "col1": "Item " + r + ".1",
                                            "col2": "Item " + r + ".2",
                                            "col3": "Item " + r + ".3",
                                            "col4": "Item " + r + ".4",
                                            "visible": true
                                        })
                                    }
                                }
                                
                                onFilterTextChanged: updateFilter()
                                
                                function updateFilter() {
                                    for (var i = 0; i < count; i++) {
                                        var item = get(i)
                                        if (filterText === "") {
                                            setProperty(i, "visible", true)
                                        } else {
                                            var matches = item.col1.toLowerCase().includes(filterText.toLowerCase())
                                            setProperty(i, "visible", matches)
                                        }
                                    }
                                }
                                
                                function sortByColumn(column) {
                                    if (sortColumn === column) {
                                        sortAscending = !sortAscending
                                    } else {
                                        sortColumn = column
                                        sortAscending = true
                                    }
                                    
                                    var colKey = "col" + (column + 1)
                                    for (var i = 0; i < count - 1; i++) {
                                        for (var j = 0; j < count - i - 1; j++) {
                                            var a = get(j)[colKey]
                                            var b = get(j + 1)[colKey]
                                            var shouldSwap = sortAscending ? (a > b) : (a < b)
                                            if (shouldSwap) {
                                                move(j, j + 1, 1)
                                            }
                                        }
                                    }
                                }
                            }
                            
                            delegate: Rectangle {
                                width: tableListView.width
                                height: visible ? 35 : 0
                                visible: model.visible
                                color: index % 2 === 0 ? palette.base : palette.alternateBase
                                
                                RowLayout {
                                    anchors.fill: parent
                                    anchors.margins: 1
                                    spacing: 1
                                    
                                    Label {
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        text: model.col1
                                        leftPadding: 8
                                        verticalAlignment: Text.AlignVCenter
                                        objectName: "tableCell_" + index + "_0"
                                        Accessible.name: "Row " + (index + 1) + " Column 1: " + text
                                        Accessible.role: Accessible.Cell
                                    }
                                    
                                    Rectangle { width: 1; Layout.fillHeight: true; color: palette.mid }
                                    
                                    Label {
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        text: model.col2
                                        leftPadding: 8
                                        verticalAlignment: Text.AlignVCenter
                                        objectName: "tableCell_" + index + "_1"
                                        Accessible.name: "Row " + (index + 1) + " Column 2: " + text
                                        Accessible.role: Accessible.Cell
                                    }
                                    
                                    Rectangle { width: 1; Layout.fillHeight: true; color: palette.mid }
                                    
                                    Label {
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        text: model.col3
                                        leftPadding: 8
                                        verticalAlignment: Text.AlignVCenter
                                        objectName: "tableCell_" + index + "_2"
                                        Accessible.name: "Row " + (index + 1) + " Column 3: " + text
                                        Accessible.role: Accessible.Cell
                                    }
                                    
                                    Rectangle { width: 1; Layout.fillHeight: true; color: palette.mid }
                                    
                                    Label {
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        text: model.col4
                                        leftPadding: 8
                                        verticalAlignment: Text.AlignVCenter
                                        objectName: "tableCell_" + index + "_3"
                                        Accessible.name: "Row " + (index + 1) + " Column 4: " + text
                                        Accessible.role: Accessible.Cell
                                    }
                                }
                                
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        AppState.setStatus("Clicked row " + (index + 1))
                                    }
                                }
                            }
                            
                            Accessible.name: "Data Table"
                            Accessible.role: Accessible.Table
                        }
                    }
                }
            }
        }
    }
}
