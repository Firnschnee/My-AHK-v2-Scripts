#Requires AutoHotkey v2.0
SendMode "Event"

; ============================================
; Zone Identifer Unlocker - see https://github.com/Firnschnee/Zone-Identifier-Unlocker
; ============================================

F23:: {
    explorerPath := GetExplorerPath()
    if !explorerPath {
        MsgBox("Kein Explorer-Fenster aktiv.")
        return
    }
    Run('powershell.exe -NoProfile -WindowStyle Hidden -Command "Get-ChildItem -Path \"' . explorerPath . '\" -Recurse | Unblock-File"')
}

GetExplorerPath() {
    for window in ComObject("Shell.Application").Windows() {
        try {
            if WinActive("ahk_id " . window.HWND)
                return window.Document.Folder.Self.Path
        }
    }
    return ""
}