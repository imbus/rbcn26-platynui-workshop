import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    // Apply enabled state to all controls
    enabled: AppState.widgetsEnabled
    
    // Apply readonly: make interactive widgets read-only but keep them visually enabled
    property bool isReadonly: AppState.widgetsReadonly
    
    ScrollView {
        anchors.fill: parent
        anchors.margins: 16
        contentWidth: availableWidth
        
        ColumnLayout {
            width: parent.width
            spacing: 12

        GroupBox {
            Layout.fillWidth: true
            title: "Buttons"
            Accessible.name: "Buttons Group"
            Accessible.role: Accessible.Grouping
            
            RowLayout {
                Button { 
                    id: regularButton
                    objectName: "regularButton"
                    text: "Regular Button"
                    Accessible.name: "Regular Button"
                    Accessible.description: "A regular button for testing"
                    Accessible.role: Accessible.Button
                    onClicked: AppState.setStatus("Regular clicked")
                }
                Button { 
                    id: primaryButton
                    objectName: "primaryButton"
                    text: "Primary Button with Icon"
                    icon.name: "emblem-favorite"
                    Accessible.name: "Primary Button with Icon"
                    Accessible.role: Accessible.Button
                    onClicked: AppState.setStatus("Primary button clicked")
                }
                ToolButton {
                    id: toolBtn
                    objectName: "toolButton"
                    text: "Tool"
                    icon.name: "edit-copy"
                    Accessible.name: "Tool Button"
                    Accessible.role: Accessible.Button
                    onClicked: AppState.setStatus("Tool Button clicked")
                }
            }
        }

        GroupBox {
            Layout.fillWidth: true
            title: "CheckBox - ComboBox - Switch"
            Accessible.name: "CheckBox - ComboBox - Switch Group"
            Accessible.role: Accessible.Grouping
            
            RowLayout {
                CheckBox { 
                    id: checkedBox
                    objectName: "checkedCheckbox"
                    text: "(checked)"
                    checked: true
                    enabled: !isReadonly
                    Accessible.name: "Checked Checkbox"
                    Accessible.role: Accessible.CheckBox
                }
                ComboBox { 
                    id: comboBox
                    objectName: "selectComboBox"
                    model: ["Select Something", "Option A", "Option B"]
                    enabled: !isReadonly
                    Accessible.name: "Select ComboBox"
                    Accessible.role: Accessible.ComboBox
                }
                Switch { 
                    id: flightSwitch
                    objectName: "flightModeSwitch"
                    text: "Flight Mode"
                    enabled: !isReadonly
                    Accessible.name: "Flight Mode Switch"
                    Accessible.role: Accessible.CheckBox
                    onToggled: AppState.setStatus(checked ? "Flight Mode ON" : "Flight Mode OFF")

                }
            }
        }

        GroupBox {
            Layout.fillWidth: true
            title: "RadioButtons"
            Accessible.name: "RadioButtons Group"
            Accessible.role: Accessible.Grouping
            
            ColumnLayout {
                spacing: 8
                
                ButtonGroup {
                    id: sizeGroup
                }
                
                RadioButton {
                    id: radioSmall
                    objectName: "radioSmall"
                    text: "Small"
                    checked: true
                    enabled: !isReadonly
                    ButtonGroup.group: sizeGroup
                    Accessible.name: "Small"
                    Accessible.role: Accessible.RadioButton
                    onToggled: if (checked) AppState.setStatus("Size: Small")
                }
                
                RadioButton {
                    id: radioMedium
                    objectName: "radioMedium"
                    text: "Medium"
                    enabled: !isReadonly
                    ButtonGroup.group: sizeGroup
                    Accessible.name: "Medium"
                    Accessible.role: Accessible.RadioButton
                    onToggled: if (checked) AppState.setStatus("Size: Medium")
                }
                
                RadioButton {
                    id: radioLarge
                    objectName: "radioLarge"
                    text: "Large"
                    enabled: !isReadonly
                    ButtonGroup.group: sizeGroup
                    Accessible.name: "Large"
                    Accessible.role: Accessible.RadioButton
                    onToggled: if (checked) AppState.setStatus("Size: Large")
                }
            }
        }

        //  Date/Time Spinner (Calendar entfernt wegen Qt6-Kompatibilität) Hier muss ich noma schauen, ob es bessere Alternativen gibt
        GroupBox {
            Layout.fillWidth: true
            title: "Date/Time"
            Accessible.name: "Date/Time Group"
            Accessible.role: Accessible.Grouping
            
            ColumnLayout {
                spacing: 8
                Label { 
                    text: "Date:" 
                    Accessible.name: "Date Label"
                    Accessible.role: Accessible.StaticText
                }
                RowLayout {
                    Label { 
                        text: "Day:" 
                        Accessible.name: "Day Label"
                        Accessible.role: Accessible.StaticText
                    }
                    SpinBox { 
                        id: day
                        objectName: "daySpinBox"
                        from: 1; to: 31; value: 1
                        editable: !isReadonly
                        enabled: !isReadonly
                        Accessible.name: "Day"
                        Accessible.role: Accessible.SpinBox
                    }
                    Label { 
                        text: "Month:" 
                        Accessible.name: "Month Label"
                        Accessible.role: Accessible.StaticText
                    }
                    SpinBox { 
                        id: month
                        objectName: "monthSpinBox"
                        from: 1; to: 12; value: 1
                        editable: !isReadonly
                        enabled: !isReadonly
                        Accessible.name: "Month"
                        Accessible.role: Accessible.SpinBox
                    }
                    Label { 
                        text: "Year:" 
                        Accessible.name: "Year Label"
                        Accessible.role: Accessible.StaticText
                    }
                    SpinBox { 
                        id: year
                        objectName: "yearSpinBox"
                        from: 2000; to: 2099; value: 2025
                        editable: !isReadonly
                        enabled: !isReadonly
                        Accessible.name: "Year"
                        Accessible.role: Accessible.SpinBox
                    }
                }
                Label { 
                    text: "Time:" 
                    Accessible.name: "Time Label"
                    Accessible.role: Accessible.StaticText
                }
                RowLayout {
                    Label { 
                        text: "Hour:" 
                        Accessible.name: "Hour Label"
                        Accessible.role: Accessible.StaticText
                    }
                    SpinBox { 
                        id: hour
                        objectName: "hourSpinBox"
                        from: 0; to: 23; value: 12
                        editable: !isReadonly
                        enabled: !isReadonly
                        Accessible.name: "Hour"
                        Accessible.role: Accessible.SpinBox
                    }
                    Label { 
                        text: "Min:" 
                        Accessible.name: "Minute Label"
                        Accessible.role: Accessible.StaticText
                    }
                    SpinBox { 
                        id: minute
                        objectName: "minuteSpinBox"
                        from: 0; to: 59; value: 0
                        editable: !isReadonly
                        enabled: !isReadonly
                        Accessible.name: "Minute"
                        Accessible.role: Accessible.SpinBox
                    }
                }
                Button {
                    id: selectDateTimeButton
                    objectName: "selectDateTimeButton"
                    text: "Select"
                    Accessible.name: "Select Date and Time"
                    Accessible.role: Accessible.Button
                    onClicked: AppState.setStatus(
                        "Selected " + day.value + "/" + month.value + "/" + year.value + " " +
                        hour.value + ":" + (minute.value < 10 ? "0" : "") + minute.value
                    )
                }
            }
        }

        GroupBox {
            Layout.fillWidth: true
            title: "Slider / Progress"
            Accessible.name: "Slider / Progress Group"
            Accessible.role: Accessible.Grouping
            
            ColumnLayout {
                width: parent.width
                spacing: 8
                
                Slider { 
                    id: slider
                    objectName: "progressSlider"
                    Layout.fillWidth: true
                    from: 0; to: 100; value: 30
                    enabled: !isReadonly
                    Accessible.name: "Progress Slider"
                    Accessible.role: Accessible.Slider
                }
                
                ProgressBar { 
                    id: prog
                    objectName: "progressBar"
                    Layout.fillWidth: true
                    from: 0; to: 100
                    value: ind.checked ? 100 : slider.value
                    indeterminate: ind.checked
                    Accessible.name: "Progress Bar"
                    Accessible.role: Accessible.ProgressBar
                }
                
                CheckBox {
                    id: ind
                    objectName: "indeterminateCheckbox"
                    text: "indeterminate"
                    enabled: !isReadonly
                    Accessible.name: "Indeterminate"
                    Accessible.role: Accessible.CheckBox
                }
            }
        }

        Label { 
            text: "Click a control to see action…" 
            Accessible.name: "Instruction: Click a control to see action"
            Accessible.role: Accessible.StaticText
        }
        Item { Layout.fillHeight: true } // Stretch
        }
    }
}
