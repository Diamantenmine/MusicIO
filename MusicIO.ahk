#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode, 2
#SingleInstance, force
#NoEnv

debug := False
toggleChromeHotkeys := True
posClick_x := 1980/2 
posClick_y := 1080/2
CoordMode, Mouse , Relative
return

NumpadIns & NumLock::
Numpad0 & NumLock::
    toggleChromeHotkeys := !toggleChromeHotkeys
    If toggleChromeHotkeys
        SoundBeep, 700, 100
    Else
        SoundBeep, 300, 100
return

#If, toggleChromeHotkeys
NumpadEnd::
Numpad1::sendKeyToYouTube("k", "{Space}")   ; pause/play

NumpadDown::
Numpad2::sendKeyToYouTube("j", "h")         ; +10 sec

NumpadPgdn::
Numpad3::sendKeyToYouTube("l", "l")         ; -10 sec

NumpadPgup::
Numpad9::sendKeyToChrome("{Up}")            ; Up

NumpadRight::
Numpad6::sendKeyToChrome("{Down}")          ; Down

NumpadHome::
Numpad7::sendKeyToChrome("^+{Tab}")         ; go tab left

NumpadUp::
Numpad8::sendKeyToChrome("^{Tab}")          ; go tab right

NumpadLeft::
Numpad4::
    focusChrome()
    ControlClick, X%posClick_x% Y%posClick_y%, Google Chrome
return
#If


sendKeyToYouTube(keyYT, keyYTMusic){
    IfWinExist, https://music.youtube.com/
    {
        sendKeyToChrome(keyYTMusic)
    }else{
        sendKeyToChrome(keyYT)
    }
}

sendKeyToChrome(key){
    focusChrome()
	ControlSend, Chrome_RenderWidgetHostHWND1, %key%, Google Chrome
}

focusChrome(){
    ControlGet, id, Hwnd,,Chrome_RenderWidgetHostHWND1, Google Chrome
	ControlFocus,,ahk_id %id%
}

;db
#If, debug
d::
    MouseGetPos, xpos, ypos 
    MsgBox, The cursor is at X%xpos% Y%ypos%.
return
e::MsgBox, X%posClick_x% Y%posClick_y%