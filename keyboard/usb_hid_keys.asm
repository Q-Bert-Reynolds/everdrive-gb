; USB HID Keyboard scan codes as per USB spec 1.11
; plus some additional codes
; 
; Created by MightyPork, 2016
; GBz80 implementation by Nolan Baker, 2021
; Public domain
; 
; Adapted from:
; https://source.android.com/devices/input/keyboard-devices.html

IF !DEF(USB_HID_KEYS)
DEF USB_HID_KEYS EQU 1
;
;Modifier masks - used for the first byte in the HID report.
;NOTE: The second byte in the report is reserved, 0x00
DEF USB_KEY_MOD_LCTRL EQU $01
DEF USB_KEY_MOD_LSHIFT EQU $02
DEF USB_KEY_MOD_LALT EQU $04
DEF USB_KEY_MOD_LMETA EQU $08
DEF USB_KEY_MOD_RCTRL EQU $10
DEF USB_KEY_MOD_RSHIFT EQU $20
DEF USB_KEY_MOD_RALT EQU $40
DEF USB_KEY_MOD_RMETA EQU $80

; Scan codes - last N slots in the HID report (usually 6).
; 0x00 if no key pressed.
; 
; If more than N keys are pressed, the HID reports 
; USB_KEY_ERR_OVF in all slots to indicate this condition.
DEF USB_KEY_NONE EQU $00 ; No key pressed
DEF USB_KEY_ERR_OVF EQU $01 ;  Keyboard Error Roll Over - used for all slots if too many keys are pressed ("Phantom key")
; 0x02 ;  Keyboard POST Fail
; 0x03 ;  Keyboard Error Undefined
DEF USB_KEY_A EQU $04 ; Keyboard a and A
DEF USB_KEY_B EQU $05 ; Keyboard b and B
DEF USB_KEY_C EQU $06 ; Keyboard c and C
DEF USB_KEY_D EQU $07 ; Keyboard d and D
DEF USB_KEY_E EQU $08 ; Keyboard e and E
DEF USB_KEY_F EQU $09 ; Keyboard f and F
DEF USB_KEY_G EQU $0a ; Keyboard g and G
DEF USB_KEY_H EQU $0b ; Keyboard h and H
DEF USB_KEY_I EQU $0c ; Keyboard i and I
DEF USB_KEY_J EQU $0d ; Keyboard j and J
DEF USB_KEY_K EQU $0e ; Keyboard k and K
DEF USB_KEY_L EQU $0f ; Keyboard l and L
DEF USB_KEY_M EQU $10 ; Keyboard m and M
DEF USB_KEY_N EQU $11 ; Keyboard n and N
DEF USB_KEY_O EQU $12 ; Keyboard o and O
DEF USB_KEY_P EQU $13 ; Keyboard p and P
DEF USB_KEY_Q EQU $14 ; Keyboard q and Q
DEF USB_KEY_R EQU $15 ; Keyboard r and R
DEF USB_KEY_S EQU $16 ; Keyboard s and S
DEF USB_KEY_T EQU $17 ; Keyboard t and T
DEF USB_KEY_U EQU $18 ; Keyboard u and U
DEF USB_KEY_V EQU $19 ; Keyboard v and V
DEF USB_KEY_W EQU $1a ; Keyboard w and W
DEF USB_KEY_X EQU $1b ; Keyboard x and X
DEF USB_KEY_Y EQU $1c ; Keyboard y and Y
DEF USB_KEY_Z EQU $1d ; Keyboard z and Z

DEF USB_KEY_1 EQU $1e ; Keyboard 1 and !
DEF USB_KEY_2 EQU $1f ; Keyboard 2 and @
DEF USB_KEY_3 EQU $20 ; Keyboard 3 and #
DEF USB_KEY_4 EQU $21 ; Keyboard 4 and $
DEF USB_KEY_5 EQU $22 ; Keyboard 5 and %
DEF USB_KEY_6 EQU $23 ; Keyboard 6 and ^
DEF USB_KEY_7 EQU $24 ; Keyboard 7 and &
DEF USB_KEY_8 EQU $25 ; Keyboard 8 and *
DEF USB_KEY_9 EQU $26 ; Keyboard 9 and (
DEF USB_KEY_0 EQU $27 ; Keyboard 0 and )

DEF USB_KEY_ENTER EQU $28 ; Keyboard Return (ENTER)
DEF USB_KEY_ESC EQU $29 ; Keyboard ESCAPE
DEF USB_KEY_BACKSPACE EQU $2a ; Keyboard DELETE (Backspace)
DEF USB_KEY_TAB EQU $2b ; Keyboard Tab
DEF USB_KEY_SPACE EQU $2c ; Keyboard Spacebar
DEF USB_KEY_MINUS EQU $2d ; Keyboard - and _
DEF USB_KEY_EQUAL EQU $2e ; Keyboard = and +
DEF USB_KEY_LEFTBRACE EQU $2f ; Keyboard [ and {
DEF USB_KEY_RIGHTBRACE EQU $30 ; Keyboard ] and }
DEF USB_KEY_BACKSLASH EQU $31 ; Keyboard \ and |
DEF USB_KEY_HASHTILDE EQU $32 ; Keyboard Non-US # and ~
DEF USB_KEY_SEMICOLON EQU $33 ; Keyboard ; and :
DEF USB_KEY_APOSTROPHE EQU $34 ; Keyboard ' and "
DEF USB_KEY_GRAVE EQU $35 ; Keyboard ` and ~
DEF USB_KEY_COMMA EQU $36 ; Keyboard , and <
DEF USB_KEY_DOT EQU $37 ; Keyboard . and >
DEF USB_KEY_SLASH EQU $38 ; Keyboard / and ?
DEF USB_KEY_CAPSLOCK EQU $39 ; Keyboard Caps Lock

DEF USB_KEY_F1 EQU $3a ; Keyboard F1
DEF USB_KEY_F2 EQU $3b ; Keyboard F2
DEF USB_KEY_F3 EQU $3c ; Keyboard F3
DEF USB_KEY_F4 EQU $3d ; Keyboard F4
DEF USB_KEY_F5 EQU $3e ; Keyboard F5
DEF USB_KEY_F6 EQU $3f ; Keyboard F6
DEF USB_KEY_F7 EQU $40 ; Keyboard F7
DEF USB_KEY_F8 EQU $41 ; Keyboard F8
DEF USB_KEY_F9 EQU $42 ; Keyboard F9
DEF USB_KEY_F10 EQU $43 ; Keyboard F10
DEF USB_KEY_F11 EQU $44 ; Keyboard F11
DEF USB_KEY_F12 EQU $45 ; Keyboard F12

DEF USB_KEY_SYSRQ EQU $46 ; Keyboard Print Screen
DEF USB_KEY_SCROLLLOCK EQU $47 ; Keyboard Scroll Lock
DEF USB_KEY_PAUSE EQU $48 ; Keyboard Pause
DEF USB_KEY_INSERT EQU $49 ; Keyboard Insert
DEF USB_KEY_HOME EQU $4a ; Keyboard Home
DEF USB_KEY_PAGEUP EQU $4b ; Keyboard Page Up
DEF USB_KEY_DELETE EQU $4c ; Keyboard Delete Forward
DEF USB_KEY_END EQU $4d ; Keyboard End
DEF USB_KEY_PAGEDOWN EQU $4e ; Keyboard Page Down
DEF USB_KEY_RIGHT EQU $4f ; Keyboard Right Arrow
DEF USB_KEY_LEFT EQU $50 ; Keyboard Left Arrow
DEF USB_KEY_DOWN EQU $51 ; Keyboard Down Arrow
DEF USB_KEY_UP EQU $52 ; Keyboard Up Arrow

DEF USB_KEY_NUMLOCK EQU $53 ; Keyboard Num Lock and Clear
DEF USB_KEY_KPSLASH EQU $54 ; Keypad /
DEF USB_KEY_KPASTERISK EQU $55 ; Keypad *
DEF USB_KEY_KPMINUS EQU $56 ; Keypad -
DEF USB_KEY_KPPLUS EQU $57 ; Keypad +
DEF USB_KEY_KPENTER EQU $58 ; Keypad ENTER
DEF USB_KEY_KP1 EQU $59 ; Keypad 1 and End
DEF USB_KEY_KP2 EQU $5a ; Keypad 2 and Down Arrow
DEF USB_KEY_KP3 EQU $5b ; Keypad 3 and PageDn
DEF USB_KEY_KP4 EQU $5c ; Keypad 4 and Left Arrow
DEF USB_KEY_KP5 EQU $5d ; Keypad 5
DEF USB_KEY_KP6 EQU $5e ; Keypad 6 and Right Arrow
DEF USB_KEY_KP7 EQU $5f ; Keypad 7 and Home
DEF USB_KEY_KP8 EQU $60 ; Keypad 8 and Up Arrow
DEF USB_KEY_KP9 EQU $61 ; Keypad 9 and Page Up
DEF USB_KEY_KP0 EQU $62 ; Keypad 0 and Insert
DEF USB_KEY_KPDOT EQU $63 ; Keypad . and Delete

DEF USB_KEY_102ND EQU $64 ; Keyboard Non-US \ and |
DEF USB_KEY_COMPOSE EQU $65 ; Keyboard Application
DEF USB_KEY_POWER EQU $66 ; Keyboard Power
DEF USB_KEY_KPEQUAL EQU $67 ; Keypad =

DEF USB_KEY_F13 EQU $68 ; Keyboard F13
DEF USB_KEY_F14 EQU $69 ; Keyboard F14
DEF USB_KEY_F15 EQU $6a ; Keyboard F15
DEF USB_KEY_F16 EQU $6b ; Keyboard F16
DEF USB_KEY_F17 EQU $6c ; Keyboard F17
DEF USB_KEY_F18 EQU $6d ; Keyboard F18
DEF USB_KEY_F19 EQU $6e ; Keyboard F19
DEF USB_KEY_F20 EQU $6f ; Keyboard F20
DEF USB_KEY_F21 EQU $70 ; Keyboard F21
DEF USB_KEY_F22 EQU $71 ; Keyboard F22
DEF USB_KEY_F23 EQU $72 ; Keyboard F23
DEF USB_KEY_F24 EQU $73 ; Keyboard F24

DEF USB_KEY_OPEN EQU $74 ; Keyboard Execute
DEF USB_KEY_HELP EQU $75 ; Keyboard Help
DEF USB_KEY_PROPS EQU $76 ; Keyboard Menu
DEF USB_KEY_FRONT EQU $77 ; Keyboard Select
DEF USB_KEY_STOP EQU $78 ; Keyboard Stop
DEF USB_KEY_AGAIN EQU $79 ; Keyboard Again
DEF USB_KEY_UNDO EQU $7a ; Keyboard Undo
DEF USB_KEY_CUT EQU $7b ; Keyboard Cut
DEF USB_KEY_COPY EQU $7c ; Keyboard Copy
DEF USB_KEY_PASTE EQU $7d ; Keyboard Paste
DEF USB_KEY_FIND EQU $7e ; Keyboard Find
DEF USB_KEY_MUTE EQU $7f ; Keyboard Mute
DEF USB_KEY_VOLUMEUP EQU $80 ; Keyboard Volume Up
DEF USB_KEY_VOLUMEDOWN EQU $81 ; Keyboard Volume Down
; 0x82  Keyboard Locking Caps Lock
; 0x83  Keyboard Locking Num Lock
; 0x84  Keyboard Locking Scroll Lock
DEF USB_KEY_KPCOMMA EQU $85 ; Keypad Comma
; 0x86  Keypad Equal Sign
DEF USB_KEY_RO EQU $87 ; Keyboard International1
DEF USB_KEY_KATAKANAHIRAGANA EQU $88 ; Keyboard International2
DEF USB_KEY_YEN EQU $89 ; Keyboard International3
DEF USB_KEY_HENKAN EQU $8a ; Keyboard International4
DEF USB_KEY_MUHENKAN EQU $8b ; Keyboard International5
DEF USB_KEY_KPJPCOMMA EQU $8c ; Keyboard International6
; 0x8d  Keyboard International7
; 0x8e  Keyboard International8
; 0x8f  Keyboard International9
DEF USB_KEY_HANGEUL EQU $90 ; Keyboard LANG1
DEF USB_KEY_HANJA EQU $91 ; Keyboard LANG2
DEF USB_KEY_KATAKANA EQU $92 ; Keyboard LANG3
DEF USB_KEY_HIRAGANA EQU $93 ; Keyboard LANG4
DEF USB_KEY_ZENKAKUHANKAKU EQU $94 ; Keyboard LANG5
; 0x95  Keyboard LANG6
; 0x96  Keyboard LANG7
; 0x97  Keyboard LANG8
; 0x98  Keyboard LANG9
; 0x99  Keyboard Alternate Erase
; 0x9a  Keyboard SysReq/Attention
; 0x9b  Keyboard Cancel
; 0x9c  Keyboard Clear
; 0x9d  Keyboard Prior
; 0x9e  Keyboard Return
; 0x9f  Keyboard Separator
; 0xa0  Keyboard Out
; 0xa1  Keyboard Oper
; 0xa2  Keyboard Clear/Again
; 0xa3  Keyboard CrSel/Props
; 0xa4  Keyboard ExSel

; 0xb0  Keypad 00
; 0xb1  Keypad 000
; 0xb2  Thousands Separator
; 0xb3  Decimal Separator
; 0xb4  Currency Unit
; 0xb5  Currency Sub-unit
DEF USB_KEY_KPLEFTPAREN EQU $b6 ; Keypad (
DEF USB_KEY_KPRIGHTPAREN EQU $b7 ; Keypad )
; 0xb8  Keypad {
; 0xb9  Keypad }
; 0xba  Keypad Tab
; 0xbb  Keypad Backspace
; 0xbc  Keypad A
; 0xbd  Keypad B
; 0xbe  Keypad C
; 0xbf  Keypad D
; 0xc0  Keypad E
; 0xc1  Keypad F
; 0xc2  Keypad XOR
; 0xc3  Keypad ^
; 0xc4  Keypad %
; 0xc5  Keypad <
; 0xc6  Keypad >
; 0xc7  Keypad &
; 0xc8  Keypad &&
; 0xc9  Keypad |
; 0xca  Keypad ||
; 0xcb  Keypad :
; 0xcc  Keypad #
; 0xcd  Keypad Space
; 0xce  Keypad @
; 0xcf  Keypad !
; 0xd0  Keypad Memory Store
; 0xd1  Keypad Memory Recall
; 0xd2  Keypad Memory Clear
; 0xd3  Keypad Memory Add
; 0xd4  Keypad Memory Subtract
; 0xd5  Keypad Memory Multiply
; 0xd6  Keypad Memory Divide
; 0xd7  Keypad +/-
; 0xd8  Keypad Clear
; 0xd9  Keypad Clear Entry
; 0xda  Keypad Binary
; 0xdb  Keypad Octal
; 0xdc  Keypad Decimal
; 0xdd  Keypad Hexadecimal

DEF USB_KEY_LEFTCTRL EQU $e0 ; Keyboard Left Control
DEF USB_KEY_LEFTSHIFT EQU $e1 ; Keyboard Left Shift
DEF USB_KEY_LEFTALT EQU $e2 ; Keyboard Left Alt
DEF USB_KEY_LEFTMETA EQU $e3 ; Keyboard Left GUI
DEF USB_KEY_RIGHTCTRL EQU $e4 ; Keyboard Right Control
DEF USB_KEY_RIGHTSHIFT EQU $e5 ; Keyboard Right Shift
DEF USB_KEY_RIGHTALT EQU $e6 ; Keyboard Right Alt
DEF USB_KEY_RIGHTMETA EQU $e7 ; Keyboard Right GUI

DEF USB_KEY_MEDIA_PLAYPAUSE EQU $e8
DEF USB_KEY_MEDIA_STOPCD EQU $e9
DEF USB_KEY_MEDIA_PREVIOUSSONG EQU $ea
DEF USB_KEY_MEDIA_NEXTSONG EQU $eb
DEF USB_KEY_MEDIA_EJECTCD EQU $ec
DEF USB_KEY_MEDIA_VOLUMEUP EQU $ed
DEF USB_KEY_MEDIA_VOLUMEDOWN EQU $ee
DEF USB_KEY_MEDIA_MUTE EQU $ef
DEF USB_KEY_MEDIA_WWW EQU $f0
DEF USB_KEY_MEDIA_BACK EQU $f1
DEF USB_KEY_MEDIA_FORWARD EQU $f2
DEF USB_KEY_MEDIA_STOP EQU $f3
DEF USB_KEY_MEDIA_FIND EQU $f4
DEF USB_KEY_MEDIA_SCROLLUP EQU $f5
DEF USB_KEY_MEDIA_SCROLLDOWN EQU $f6
DEF USB_KEY_MEDIA_EDIT EQU $f7
DEF USB_KEY_MEDIA_SLEEP EQU $f8
DEF USB_KEY_MEDIA_COFFEE EQU $f9
DEF USB_KEY_MEDIA_REFRESH EQU $fa
DEF USB_KEY_MEDIA_CALC EQU $fb

ENDC ;USB_HID_KEYS
