; AutoHotkey script for disconnecting and reconnecting to Wi-Fi with debounce

F5::
    ; Check if the debounce timer is still active
    if (A_TickCount - lastF5Press < debounceTime) {
        return
    }
    
    ; Record the time of this key press
    lastF5Press := A_TickCount

    ; Run the netsh commands
    RunWait, %ComSpec% /c netsh wlan disconnect,, Hide
    Sleep, 8000
    RunWait, %ComSpec% /c netsh wlan connect name="NETGEAR56-5G",, Hide

return

; Variables
lastF5Press := 0
debounceTime := 10000  ; Debounce time in milliseconds (10 seconds)
