#Requires AutoHotkey v2.0
SendMode "Event"

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
