import * as React from "react"
import * as Oni from "oni-api"

export const deactivate = (oni: Oni.Plugin.Api) => {
  console.log("config deactivated")
}

export const configuration = {
  "sidebar.enabled": false,
  "ui.colorscheme": "onedark",
  "oni.loadInitVim": true,
  "editor.fontSize": "10px",
  "editor.fontFamily": "Fira Code",
  "editor.fontLigatures": true,
  "ui.animations.enabled": true,
  "ui.fontSmoothing": "auto",
  "statusbar.fontSize": "0.8em",
  "ui.fontSize": "10px",
  "tabs.height": "2em",
}
