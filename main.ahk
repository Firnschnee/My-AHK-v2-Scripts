#Requires AutoHotkey v2.0
SendMode "Event"

; ============================================
; Firefox Tab Navigation
; ============================================
#HotIf WinActive("ahk_class MozillaWindowClass")
!w::Send("^+t")       ; Alt + W = Tab wiederherstellen
!a::Send("^+{Tab}")   ; Alt + A = Tab zurück
!d::Send("^{Tab}")    ; Alt + D = Tab vor
#HotIf

; ============================================
; Special Characters (System-wide)
; ============================================
!2::Send("²")
!3::Send("³")
!7::SendText("{")
!8::SendText("[")
!9::SendText("]")
!0::SendText("}")
!ß::Send("\")
!+::Send("~")
!q::Send("@")
!e::Send("€")
!m::Send("µ")
!sc056::Send("|")     ; < on ISO-DE Layout
^y::Send("^z")        ; Ctrl + Y = Undo (Ctrl + Z)
!#::SendText(chr(96)) ; Alt + # = Backtick

; ============================================
; Excel Sheet Navigation
; ============================================
#HotIf WinActive("ahk_class XLMAIN")
!a::Send("^{PgUp}")   ; Alt + A = Sheet left
!d::Send("^{PgDn}")   ; Alt + D = Sheet right
#HotIf

; ============================================
; Windows & Desktop Navigation
; ============================================
#f::Send("{F14}")     ; Win + F = F14
#a::Send("^#{Left}")  ; Win + A = Prev Virtual Desktop

#d::Send("^#{Right}") ; Win + D = Next Virtual Desktop

; ============================================
; Windows Explorer Hacks (Middle Click & Open as new Tab (does not work reliable))
; ============================================

#HotIf WinActive("ahk_class CabinetWClass")
MButton:: {
    Click "Middle"
    Sleep 80
    Send "^{Tab}"  ; Fokus auf zuletzt geöffneten Tab
}
#HotIf

/*
#HotIf
#e:: {
    if WinExist("ahk_class CabinetWClass") {
        WinActivate
        Sleep 80
        Send "^t"
    } else {
        Run "explorer.exe"
        WinWaitActive "ahk_class CabinetWClass",, 1
    }
}
*/

; ============================================
; Fix Word Theme Dark Mode Bug
; ============================================

F24:: FixWordTheme()

FixWordTheme() {
    if !WinExist("ahk_exe WINWORD.EXE")
        return

    WinActivate "ahk_exe WINWORD.EXE"
    WinWaitActive "ahk_exe WINWORD.EXE",, 2

    ; Zu White wechseln (Item 3)
    Send "!d"
    Sleep 400
    Send "t"
    Sleep 600
    Send "y2"
    Sleep 400
    Send "{Home}"
    Sleep 100
    Send "{Down}{Down}"
    Sleep 100
    Send "{Enter}"
    Sleep 800

    ; Backstage erneut öffnen → zurück zu Black (Item 2)
    Send "!d"
    Sleep 400
    Send "t"
    Sleep 600
    Send "y2"
    Sleep 400
    Send "{Home}"
    Sleep 100
    Send "{Down}"
    Sleep 100
    Send "{Enter}"
    Sleep 300

    Send "{Escape}"
}

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
