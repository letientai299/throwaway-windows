import * as React from "react"
import * as Oni from "oni-api"

export const deactivate = (oni: Oni.Plugin.Api) => {
  console.log("config deactivated")
}

export const configuration = {
  "sidebar.enabled": false,
  "ui.colorscheme": "onedark",
  "oni.hideMenu": true, // Hide default menu, can be opened with <alt>
  "commandline.mode": false, // Do not override commandline UI
  "learning.enabled": false, // Turn off learning pane
  "achievements.enabled": false, // Turn off achievements tracking / UX
  "editor.textMateHighlighting.enabled": false, // Use vim syntax highlighting
  "editor.typingPrediction": false, // Wait for vim's confirmed typed characters, avoid edge cases
  "oni.loadInitVim": true,
  "editor.fontSize": "9px",
  "editor.fontFamily": "Fira Code",
  "editor.fontLigatures": true,
  "ui.animations.enabled": true,
  "ui.fontSmoothing": "auto",
  "statusbar.fontSize": "0.8em",
  "ui.fontSize": "10px",
  "tabs.height": "2em",
}
