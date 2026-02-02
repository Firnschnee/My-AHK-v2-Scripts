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
!#::SendText(chr(96))

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