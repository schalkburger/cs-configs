#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance ignore

CoordMode, Mouse, Screen
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetBatchLines -1

	;Settings
	moveCount := 25
	sleepInterval := 2
	relativeMove := 28

soundbeep1() {
	SoundBeep, 450, 150
}

soundbeep2() {
	SoundBeep, 80, 150
}

soundbeep3() {
	SoundBeep, 80, 350
}

F4::Reload, soundbeep3()
F5::ExitApp

jump() {                                    
	Send, {Space}
}

CapsLock::

BHopOn += 1
if(BHopOn > 1){                                                                          
	BHopOn = 0
}
if(BHopOn == 0) {
	soundbeep2()
	GuiControl, , BHOP, BHop: Off
}
else
	soundbeep1()
	GuiControl, , BHOP, BHop: On
 
return
 
*Space::
 
	if(BHopOn == 1){
		While GetKeyState("Space", "P"){
			Send {Space Down}
			Sleep 20
			Send {Space Up}
			Sleep 30 ;This is the wait time between the space presses
		}
	}else{
		Send {Space Down}
		KeyWait, Space
		Send {Space Up}
	}
 
return