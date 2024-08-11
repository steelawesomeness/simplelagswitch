F5::
    if (A_TickCount - lastF5Press < debounceTime) {
        return
    }
    
    lastF5Press := A_TickCount

    RunWait, %ComSpec% /c netsh interface show interface name="Ethernet" | findstr /c:"Connected",, Hide
    if ErrorLevel = 0 {
        RunWait, %ComSpec% /c netsh interface set interface "Ethernet" admin=disable,, Hide
        Sleep, 8000
        RunWait, %ComSpec% /c netsh interface set interface "Ethernet" admin=enable,, Hide
    } else {
        RunWait, %ComSpec% /c netsh wlan disconnect,, Hide
        Sleep, 8000
        RunWait, %ComSpec% /c netsh wlan connect,, Hide
    }

return

lastF5Press := 0
debounceTime := 10000  ; Debounce time in milliseconds (10 seconds)
