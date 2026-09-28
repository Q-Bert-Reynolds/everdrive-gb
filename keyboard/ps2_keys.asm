IF !DEF(PS2_KEYS)
DEF PS2_KEYS EQU 1

;******************************************************************************************************
;Response Codes
;******************************************************************************************************
DEF PS2_NULL   EQU $00;also an error
DEF PS2_ERROR  EQU $FF
DEF PS2_ACK    EQU $FA

DEF PS2_EXTENDED_KEY_PREFIX EQU $E0
DEF PS2_RELEASED_KEY_PREFIX EQU $F0

;No press prefix. Release prefix is $F0
DEF PS2_KEY_ESC                  EQU $76
DEF PS2_KEY_F1                   EQU $05
DEF PS2_KEY_F2                   EQU $06
DEF PS2_KEY_F3                   EQU $04
DEF PS2_KEY_F4                   EQU $0C
DEF PS2_KEY_F5                   EQU $03
DEF PS2_KEY_F6                   EQU $0B
DEF PS2_KEY_F7                   EQU $83
DEF PS2_KEY_F8                   EQU $0A
DEF PS2_KEY_F9                   EQU $01
DEF PS2_KEY_F10                  EQU $09
DEF PS2_KEY_F11                  EQU $78
DEF PS2_KEY_F12                  EQU $07

DEF PS2_KEY_GRAVE                EQU $0E
DEF PS2_KEY_1                    EQU $16
DEF PS2_KEY_2                    EQU $1E
DEF PS2_KEY_4                    EQU $25
DEF PS2_KEY_3                    EQU $26
DEF PS2_KEY_5                    EQU $2E
DEF PS2_KEY_6                    EQU $36
DEF PS2_KEY_7                    EQU $3D
DEF PS2_KEY_8                    EQU $3E
DEF PS2_KEY_9                    EQU $46
DEF PS2_KEY_0                    EQU $45
DEF PS2_KEY_MINUS                EQU $4E
DEF PS2_KEY_EQUALS               EQU $55
DEF PS2_KEY_BACKSPACE            EQU $66

DEF PS2_KEY_TAB                  EQU $0D
DEF PS2_KEY_Q                    EQU $15
DEF PS2_KEY_W                    EQU $1D
DEF PS2_KEY_E                    EQU $24
DEF PS2_KEY_R                    EQU $2D
DEF PS2_KEY_T                    EQU $2C
DEF PS2_KEY_Y                    EQU $35
DEF PS2_KEY_U                    EQU $3C
DEF PS2_KEY_I                    EQU $43
DEF PS2_KEY_O                    EQU $44
DEF PS2_KEY_P                    EQU $4D
DEF PS2_KEY_LEFT_SQUARE_BRACKET  EQU $54
DEF PS2_KEY_RIGHT_SQUARE_BRACKET EQU $5B
DEF PS2_KEY_BACKSLASH            EQU $5D

DEF PS2_KEY_CAPS_LOCK            EQU $58
DEF PS2_KEY_A                    EQU $1C
DEF PS2_KEY_S                    EQU $1B
DEF PS2_KEY_D                    EQU $23
DEF PS2_KEY_F                    EQU $2B
DEF PS2_KEY_G                    EQU $34
DEF PS2_KEY_H                    EQU $33
DEF PS2_KEY_J                    EQU $3B
DEF PS2_KEY_K                    EQU $42
DEF PS2_KEY_L                    EQU $4B
DEF PS2_KEY_SEMI_COLON           EQU $4C
DEF PS2_KEY_APOSTROPHE           EQU $52
DEF PS2_KEY_ENTER                EQU $5A

DEF PS2_KEY_SHIFT_LEFT           EQU $12
DEF PS2_KEY_Z                    EQU $1A
DEF PS2_KEY_X                    EQU $22
DEF PS2_KEY_C                    EQU $21
DEF PS2_KEY_V                    EQU $2A
DEF PS2_KEY_B                    EQU $32
DEF PS2_KEY_N                    EQU $31
DEF PS2_KEY_M                    EQU $3A
DEF PS2_KEY_COMMA                EQU $41
DEF PS2_KEY_PERIOD               EQU $49
DEF PS2_KEY_SLASH                EQU $4A
DEF PS2_KEY_SHIFT_RIGHT          EQU $59

DEF PS2_KEY_CTRL_LEFT            EQU $14
DEF PS2_KEY_ALT_LEFT             EQU $11
DEF PS2_KEY_SPACEBAR             EQU $29

DEF PS2_KEY_SCROLL_LOCK          EQU $7E
DEF PS2_KEY_NUM_LOCK             EQU $77
DEF PS2_KEY_KEYPAD_PERIOD        EQU $71
DEF PS2_KEY_KEYPAD_ASTERISK      EQU $7C
DEF PS2_KEY_KEYPAD_MINUS         EQU $7B
DEF PS2_KEY_KEYPAD_PLUS          EQU $79
DEF PS2_KEY_KEYPAD_0             EQU $70
DEF PS2_KEY_KEYPAD_1             EQU $69
DEF PS2_KEY_KEYPAD_2             EQU $72
DEF PS2_KEY_KEYPAD_3             EQU $7A
DEF PS2_KEY_KEYPAD_4             EQU $6B
DEF PS2_KEY_KEYPAD_5             EQU $73
DEF PS2_KEY_KEYPAD_6             EQU $74
DEF PS2_KEY_KEYPAD_7             EQU $6C
DEF PS2_KEY_KEYPAD_8             EQU $75
DEF PS2_KEY_KEYPAD_9             EQU $7D

;Pressed prefix $E0, released prefix $E0F0
DEF PS2_KEY_KEYPAD_SLASH         EQU $4A
DEF PS2_KEY_KEYPAD_ENTER         EQU $5A

DEF PS2_KEY_SUPER_LEFT           EQU $1F
DEF PS2_KEY_SUPER_RIGHT          EQU $27
DEF PS2_KEY_ALT_RIGHT            EQU $11
DEF PS2_KEY_CTRL_RIGHT           EQU $14

DEF PS2_KEY_MENUS                EQU $2F
DEF PS2_KEY_INSERT               EQU $70
DEF PS2_KEY_HOME                 EQU $6C
DEF PS2_KEY_PAGE_UP              EQU $7D
DEF PS2_KEY_DELETE               EQU $71
DEF PS2_KEY_END                  EQU $69
DEF PS2_KEY_PAGE_DOWN            EQU $7A

DEF PS2_KEY_UP_ARROW             EQU $75
DEF PS2_KEY_LEFT_ARROW           EQU $6B
DEF PS2_KEY_DOWN_ARROW           EQU $72
DEF PS2_KEY_RIGHT_ARROW          EQU $74

DEF PS2_KEY_PRINT_SCREEN_INIT    EQU $12
DEF PS2_KEY_PRINT_SCREEN_SEND    EQU $7C;Print screen presses 12, presses 7C, releases 7C, releases 12

;$E1 prefix, CTRL, NUM LOCK, $E1 prefix, release CTRL, $E0 prefix, NUM LOCK
; DEF PS2_KEY_PAUSE_BREAK          EQU $E11477E1F014E077;NOTE: too large to be an integer constant

;******************************************************************************************************
; PS/2 Control Commands
; Commands cannot be sent from GameBoy since GB to PS/2 cable doesn't have serial out connected.
; They're left below for completeness.
;******************************************************************************************************
DEF PS2_RESEND EQU $FE ;ask to be resent last scan code, response is previously sent byte resend
DEF PS2_ECHO   EQU $EE ;response is echo or resend

DEF PS2_ENABLE_SCANNING  EQU $F4 ;keyboard will send scan codes, response is ack or resend
DEF PS2_DISABLE_SCANNING EQU $F5 ;keyboard won't send scan codes, response is ack or resend
DEF PS2_SET_DEFAULT      EQU $F6 ;Set default parameters, response is ack or resend
DEF PS2_RESET_AND_TEST   EQU $FF ;Reset and start self-test, response is 0xAA (self-test passed), 0xFC or 0xFD (self test failed), or resend

;Sets typematic rate and delay
; 0 to 4 	Repeat rate (00000b = 30 Hz, ..., 11111b = 2 Hz)
; 5 to 6 	Delay before keys repeat (00b = 250 ms, 01b = 500 ms, 10b = 750 ms, 11b = 1000 ms)
; 7 	Must be zero
DEF PS2_TYPEMATIC EQU $F3;data = %0DDRRRRR, response is ack or resend

;identifies keyboard/mouse, scanning must be disabled first
; https://wiki.osdev.org/%228042%22_PS/2_Controller#Detecting_PS.2F2_Device_Types
DEF PS2_IDENTIFY EQU $F2;response is ack followed by 0 to 2 bytes

;enable/disable keyboard (C)aps, (N)um, and (S)croll lock lights
DEF PS2_LED_CONTROL EQU $ED;data = %xxxxxCNS, response is ack or resend
DEF PS2_LED_SCROLL_LOCK EQU %001
DEF PS2_LED_NUM_LOCK    EQU %010
DEF PS2_LED_CAPS_LOCK   EQU %100

;get/set current scan code set
DEF PS2_SCAN_CODE EQU $F0;data is scan code set or 0 for get, response is ack (followed by current set if getting) or resend
DEF PS2_SCAN_CODE_GET   EQU 0
DEF PS2_SCAN_CODE_SET_1 EQU 1
DEF PS2_SCAN_CODE_SET_2 EQU 2;make sure this is the scan code set used
DEF PS2_SCAN_CODE_SET_3 EQU 3

ENDC ;PS2_KEYS
