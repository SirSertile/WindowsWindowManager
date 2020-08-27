; Function to add up to a certain amount of screens
; Requires the Screens argument
#SingleInstance, Force

AddUpTo(Screens)
{
  AddUpTo = 
  (
    $DesktopCount = Get-DesktopCount
    # Checks the number of desktops
    if ($DesktopCount -lt %Screens%){
      # If less than ScreenCount desktops, create the remaining desktops
      for ($i=0; $i -lt %Screens%-$DesktopCount; $i++){
        New-Desktop
      }
    }
    exit
  )
  Run powershell.exe -Command "&{%AddUpTo%}" ,,hide
}

; Handles the switching of screens - gracefully adding them if the screen doesn't exist
; Requires the Index argument
ChangeDesktop(Index)
{
  AddUpTo(%Index%)
  SwitchScript =
  ( 
    Switch-Desktop -Desktop %Index%
    exit
  )
  Run powershell.exe -Command "&{%SwitchScript%}" ,,hide
}

; Running initial setup
Run powershell.exe -NoExit -Command "&{Import-Module VirtualDesktop}" ,,hide
AddUpTo(10)

; Actual Keybinds

; Accessing Desktop by Relative Location

; Next Virtual Desktop
#,::
Send ^#{Left}
return

; Previous Virtual Desktop
#.::
Send ^#{Right}
return



; Accessing Desktop by Index
; I hate this, maybe I'll fix it later

#1::
ChangeDesktop(0)
return

#2::
ChangeDesktop(1)
return

#3::
ChangeDesktop(2)
return

#4::
ChangeDesktop(3)
return

#5::
ChangeDesktop(4)
return

#6::
ChangeDesktop(5)
return

#7::
ChangeDesktop(6)
return

#8::
ChangeDesktop(7)
return

#9::
ChangeDesktop(8)
return

#0::
ChangeDesktop(9)
return

