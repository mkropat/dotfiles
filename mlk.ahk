#SingleInstance force

Capslock::Ctrl

^End::Send {Media_Play_Pause}
^PgUp::Send {Media_Prev}
^PgDn::Send {Media_Next}

; Disable ctrl+scroll zooming
^WheelDown::return
^WheelUp::return
