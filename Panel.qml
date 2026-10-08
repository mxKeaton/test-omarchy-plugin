import QtQuick
import qs.Commons
import qs.Ui

// A deliberately tiny Omarchy bar widget: a button that opens a panel showing
// lorem ipsum. Nothing else. Used as a safe target for plugin-patching tests.
Panel {
  id: root
  moduleName: "io.github.mxkeaton.test-omarchy-plugin"
  ipcTarget: "io.github.mxkeaton.test-omarchy-plugin"

  readonly property color fg: bar ? bar.foreground : Color.foreground
  readonly property string ff: bar ? bar.fontFamily : Style.font.family

  // The bar sizes the widget slot from these.
  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  BarIconButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: "\uf15c"
    tooltipText: "Test Omarchy Plugin"
    onPressed: root.toggle()
  }

  KeyboardPanel {
    id: panel
    anchorItem: button
    owner: root
    bar: root.bar
    open: root.opened
    focusTarget: keyCatcher
    contentWidth: panel.fittedContentWidth(Style.space(520))
    contentHeight: panel.fittedContentHeight(column.implicitHeight)

    PanelKeyCatcher {
      id: keyCatcher
      anchors.fill: parent
      onCloseRequested: root.close()

      Column {
        id: column
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        spacing: Style.space(10)

        Text {
          text: "Test Omarchy Plugin"
          color: root.fg
          font.family: root.ff
          font.pixelSize: Style.font.title
          font.bold: true
        }

        PanelSeparator { foreground: Util.alpha(root.fg, 0.15) }

        Text {
          textFormat: Text.PlainText
          text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
          color: root.fg
          font.family: root.ff
          font.pixelSize: Style.font.body
          wrapMode: Text.WordWrap
          width: parent.width
        }
      }
    }
  }
}
