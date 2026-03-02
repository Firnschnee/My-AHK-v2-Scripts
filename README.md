## My AHK v2 Scripts

Collection of my AutoHotkey v2 scripts for Windows 11 quality-of-life improvements.

## The Problem

ISO-DE (QWERTZ / German) keyboards make many special characters hard to reach:
- `AltGr + Q = @` is awkward
- `Ctrl + Z = Undo` instead of `Ctrl + Y` (I mean.. why? It would be so much more easier to reach, right next to `Ctrl + X`, `Ctrl + C` and `Ctrl + V`)

This script also remaps `AltGr` combinations to `Alt` for easier access.

## What's included

**Undo-Shortcut-Fix**
- `Ctrl + Y` = Undo

**Special Characters (System-wide)**
- `Alt + Q = @`, `Alt + E = €`, `Alt + M = µ`, etc.
- `Alt + 2/3/7/8/9/0/ß/+ = ² ³ { [ ] } \ ~`
- Works everywhere

**Firefox Tab Navigation**
- `Alt + A` = Previous tab
- `Alt + D` = Next tab
- `Alt + W` = Restore closed tab

**Excel Sheet Navigation**
- `Alt + A` = Previous sheet
- `Alt + D` = Next sheet

**Windows Virtual Desktop**
- `Win + A` = Previous desktop
- `Win + D` = Next desktop

**Everything shortcut + disable Feedback Hub**
- `Win + F` = F14 (Because Search should be on Win + F imho)

**Fast single Backtick deployment :D** 
- `Alt + #` = ` (Press 1x and get the Backtime once. No need for double press). 

**Word Dark Theme Fix**
- `F24` — Workaround for a Word Dark Mode rendering bug (German localization).
  When using the Black Office theme, the Navigation Pane or Search Results Pane
  occasionally renders text in black-on-black, making it unreadable. This macro
  forces a theme cycle (Black → White → Black) to trigger a UI redraw.
  
  > German Word only. The Backstage keyboard shortcuts (`Alt+D → T → Y2`) are
  > localization-specific and will not work in other language versions.
  
  I mapped it to `MO(1) + F12` via QMK/Vial.

**Zone-Identifier-Script**
- `F23` = my [Zone-Identifier-Unlocker-Script](https://github.com/Firnschnee/Zone-Identifier-Unlocker)
  I mapped it to `MO(1) + F11` via QMK/Vial.
  
## Requirements

- Windows 10+
- AutoHotkey v2 installed
- Administrator privileges

## Usage

1. Download `main.ahk`
2. Run with AutoHotkey v2

## License
MIT License – See [LICENSE](LICENSE) file
