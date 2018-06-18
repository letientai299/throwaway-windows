# Setup a throwaway window development environment

## Use case

Need to get shit done when the beloved machine is broken and we have to use any Windows machine at the gaming rooms (which will be reset after restarted).

**Dont's use this guide** if the machine is not yours, and it's not gonna be reseted. As we will install a bunch of tools on it. Or, if you want to seriously setup a working environment, then build your own (I'm mostly write this for myself)

## Prerequisite

Windows admin priviledge

## Expected result

- Env for Java, Nodejs development.
- Common development tools: IntelliJ, VsCode, Git
- Utilities: sumatrapdf reader, Firefox

## Steps

### Install package manager and available packages

Run the `install-packages.bat` script. This will install chocolatey and some tools.

### Setup Firefox


### Install tools that can't found on Chocolatey registry

#### Altdrag 

https://stefansundin.github.io/altdrag/

Bring Alt-<Mouse drag and resize> feature on Linux to Windows.

#### Firefox Addons

I really wish Firefox to support addons managements via CLI.

- [Zoom Page WE](https://addons.mozilla.org/en-US/firefox/addon/zoom-page-we)
- [Gesturify](https://addons.mozilla.org/en-US/firefox/addon/gesturefy)
- [Ublock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin)
- [Enhancer for youtube](https://addons.mozilla.org/en-US/firefox/addon/enhancer-for-youtube/?src=search)
- [1-Click YouTube Video Download](https://addons.mozilla.org/en-US/firefox/addon/1-click-youtube-video-downl/?src=search)
- [Ghostery](https://addons.mozilla.org/en-US/firefox/addon/ghostery/?src=search)
- [Surfingkeys](https://addons.mozilla.org/en-US/firefox/addon/surfingkeys_ff/?src=search)

#### Execute autohotkey script

Right click on `remap-caplock.ahk` and select "Run Script"