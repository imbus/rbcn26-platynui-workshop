pragma Singleton
import QtQuick

QtObject {
    id: theme
    
    // Theme state
    property bool isDark: false
    
    // Modern Color Palette - Light Mode
    readonly property color lightBackground: "#ffffff"
    readonly property color lightSurface: "#f8f9fa"
    readonly property color lightSurfaceVariant: "#e9ecef"
    readonly property color lightPrimary: "#0d6efd"
    readonly property color lightPrimaryHover: "#0b5ed7"
    readonly property color lightOnPrimary: "#ffffff"
    readonly property color lightText: "#212529"
    readonly property color lightTextSecondary: "#6c757d"
    readonly property color lightBorder: "#dee2e6"
    readonly property color lightDivider: "#e9ecef"
    readonly property color lightError: "#dc3545"
    readonly property color lightSuccess: "#198754"
    
    // Modern Color Palette - Dark Mode
    readonly property color darkBackground: "#0d1117"
    readonly property color darkSurface: "#161b22"
    readonly property color darkSurfaceVariant: "#21262d"
    readonly property color darkPrimary: "#58a6ff"
    readonly property color darkPrimaryHover: "#79c0ff"
    readonly property color darkOnPrimary: "#0d1117"
    readonly property color darkText: "#e6edf3"
    readonly property color darkTextSecondary: "#8b949e"
    readonly property color darkBorder: "#30363d"
    readonly property color darkDivider: "#21262d"
    readonly property color darkError: "#f85149"
    readonly property color darkSuccess: "#3fb950"
    
    // Dynamic properties based on isDark
    property color background: isDark ? darkBackground : lightBackground
    property color surface: isDark ? darkSurface : lightSurface
    property color surfaceVariant: isDark ? darkSurfaceVariant : lightSurfaceVariant
    property color primary: isDark ? darkPrimary : lightPrimary
    property color primaryHover: isDark ? darkPrimaryHover : lightPrimaryHover
    property color onPrimary: isDark ? darkOnPrimary : lightOnPrimary
    property color text: isDark ? darkText : lightText
    property color textSecondary: isDark ? darkTextSecondary : lightTextSecondary
    property color border: isDark ? darkBorder : lightBorder
    property color divider: isDark ? darkDivider : lightDivider
    property color error: isDark ? darkError : lightError
    property color success: isDark ? darkSuccess : lightSuccess
    
    // Spacing & Sizing
    readonly property int spacingXs: 4
    readonly property int spacingS: 8
    readonly property int spacingM: 16
    readonly property int spacingL: 24
    readonly property int spacingXl: 32
    
    readonly property int radiusS: 4
    readonly property int radiusM: 8
    readonly property int radiusL: 12
    
    // Typography
    readonly property int fontSizeSmall: 11
    readonly property int fontSizeBody: 13
    readonly property int fontSizeLarge: 15
    readonly property int fontSizeH3: 18
    readonly property int fontSizeH2: 22
    readonly property int fontSizeH1: 28
    
    // Animation durations (ms)
    readonly property int animationFast: 100
    readonly property int animationNormal: 200
    readonly property int animationSlow: 300
}
