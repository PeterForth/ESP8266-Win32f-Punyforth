\ ESP8266-77.FRM

anew ESP8266-77.FRM

Decimal

\- textbox needs excontrols.f
\- usebitmap needs bitmap.f

0 value ESP12-nodemcu-MINI  \ is Bitmap handle for ESP12-nodemcu-MINI.bmp

: Load:ESP12-nodemcu-MINI z" ESP12-nodemcu-MINI.bmp" LoadBitmap to ESP12-nodemcu-MINI ;
0 value led-on21  \ is Bitmap handle for led-on21.bmp
: Load:led-on21 z" led-on21.bmp" LoadBitmap to led-on21 ;
0 value led-off21  \ is Bitmap handle for led-off21.bmp
: Load:led-off21 z" led-off21.bmp" LoadBitmap to led-off21 ;
0 value error  \ is Bitmap handle for error.bmp
: Load:error z" error.bmp" LoadBitmap to error ;
\- -filelister.f needs filelister.f   \ folder browser

\- Control# 0 value Control#

Label Label3
BitmapButton Bitmap299
BitmapButton STATIC12
PushButton GPIO16
PushButton GPIO5
PushButton GPIO4
PushButton GPIO0
PushButton GPIO2
BitmapButton Bitmap2
Label Label1
Label Label2
BitmapButton Bitmap3
BitmapButton Bitmap4
BitmapButton Bitmap5
PushButton GPIO14
PushButton GPIO12
PushButton GPIO13
PushButton GPIO15
PushButton GPIO3
PushButton GPIO1
RadioButton OUT4
PushButton ADC0
PushButton Button15
PushButton Button16
PushButton GPIO10
PushButton GPIO9
PushButton MOSI
PushButton CS
PushButton MISO
PushButton SCLK
PushButton ENAB
PushButton RST
BitmapButton Bitmap6
BitmapButton Bitmap7
BitmapButton Bitmap8
BitmapButton Bitmap9
BitmapButton Bitmap10
BitmapButton Bitmap11
BitmapButton Bitmap12
BitmapButton Bitmap13
BitmapButton Bitmap14
BitmapButton Bitmap15
BitmapButton Bitmap16
BitmapButton Bitmap17
BitmapButton Bitmap18
BitmapButton Bitmap19
BitmapButton Bitmap20
BitmapButton Bitmap21
BitmapButton Bitmap22
BitmapButton Bitmap23
RadioButton IN16
RadioButton IN5
RadioButton OUT5
RadioButton IN6
RadioButton OUT7
StaticBitmap Static1

FileWindow FileWindow1

  ComboBox Combo1

PushButton Button23
Label Label4
Label Label5
Label Label6
Label Label7
BitmapButton Bitmap28BUT
ComboBox Combo2
BitmapButton Bitmap26
BitmapButton Bitmap27
BitmapButton Bitmap28

: Bitmap! ( handle n -- )
        case
        2 of setimage: Bitmap299 endof
        3 of setimage: STATIC12 endof
        9 of setimage: Bitmap2 endof
        12 of setimage: Bitmap3 endof
        13 of setimage: Bitmap4 endof
        14 of setimage: Bitmap5 endof
        33 of setimage: Bitmap6 endof
        34 of setimage: Bitmap7 endof
        35 of setimage: Bitmap8 endof
        36 of setimage: Bitmap9 endof
        37 of setimage: Bitmap10 endof
        38 of setimage: Bitmap11 endof
        39 of setimage: Bitmap12 endof
        40 of setimage: Bitmap13 endof
        41 of setimage: Bitmap14 endof
        42 of setimage: Bitmap15 endof
        43 of setimage: Bitmap16 endof
        44 of setimage: Bitmap17 endof
        45 of setimage: Bitmap18 endof
        46 of setimage: Bitmap19 endof
        47 of setimage: Bitmap20 endof
        48 of setimage: Bitmap21 endof
        49 of setimage: Bitmap22 endof
        50 of setimage: Bitmap23 endof
        56 of setimage: Static1 endof
        64 of setimage: Bitmap28BUT endof
        66 of setimage: Bitmap26 endof
        67 of setimage: Bitmap27 endof
        68 of setimage: Bitmap28 endof
        drop endcase ;

' Bitmap! alias ESP8266-Bitmap!

:Object ESP8266                <Super Window

Font WinFont           \ default font
' 2drop value WmCommand-Func   \ function pointer for WM_COMMAND
ColorObject FrmColor      \ the background color

\ Font setting definitions

Font Label3-font
: Set-Label3-font ( -- )
                -19          Height: Label3-font
                0             Width: Label3-font
                0        Escapement: Label3-font
                0       Orientation: Label3-font
                700          Weight: Label3-font
                0           CharSet: Label3-font
                1      OutPrecision: Label3-font
                2     ClipPrecision: Label3-font
                1           Quality: Label3-font
                34   PitchAndFamily: Label3-font
                s" MS Sans Serif" SetFacename: Label3-font ;

Font Label1-font
: Set-Label1-font ( -- )
                -32          Height: Label1-font
                0             Width: Label1-font
                0        Escapement: Label1-font
                0       Orientation: Label1-font
                700          Weight: Label1-font
                0           CharSet: Label1-font
                3      OutPrecision: Label1-font
                2     ClipPrecision: Label1-font
                1           Quality: Label1-font
                34   PitchAndFamily: Label1-font
                s" Tahoma" SetFacename: Label1-font ;

Font OUT4-font
: Set-OUT4-font ( -- )
                -8           Height: OUT4-font
                0             Width: OUT4-font
                0        Escapement: OUT4-font
                0       Orientation: OUT4-font
                700          Weight: OUT4-font
                255         CharSet: OUT4-font
                1      OutPrecision: OUT4-font
                2     ClipPrecision: OUT4-font
                1           Quality: OUT4-font
                49   PitchAndFamily: OUT4-font
                s" Terminal" SetFacename: OUT4-font ;

Font OUT5-font
: Set-OUT5-font ( -- )
                -8           Height: OUT5-font
                0             Width: OUT5-font
                0        Escapement: OUT5-font
                0       Orientation: OUT5-font
                700          Weight: OUT5-font
                255         CharSet: OUT5-font
                1      OutPrecision: OUT5-font
                2     ClipPrecision: OUT5-font
                1           Quality: OUT5-font
                49   PitchAndFamily: OUT5-font
                s" Terminal" SetFacename: OUT5-font ;

Font Button23-font
: Set-Button23-font ( -- )
                -19          Height: Button23-font
                0             Width: Button23-font
                0        Escapement: Button23-font
                0       Orientation: Button23-font
                700          Weight: Button23-font
                0           CharSet: Button23-font
                3      OutPrecision: Button23-font
                2     ClipPrecision: Button23-font
                1           Quality: Button23-font
                34   PitchAndFamily: Button23-font
                s" Arial Black" SetFacename: Button23-font ;

Font Label4-font
: Set-Label4-font ( -- )
                -19          Height: Label4-font
                0             Width: Label4-font
                0        Escapement: Label4-font
                0       Orientation: Label4-font
                700          Weight: Label4-font
                0           CharSet: Label4-font
                1      OutPrecision: Label4-font
                2     ClipPrecision: Label4-font
                1           Quality: Label4-font
                34   PitchAndFamily: Label4-font
                s" MS Sans Serif" SetFacename: Label4-font ;

Font Label5-font
: Set-Label5-font ( -- )
                -19          Height: Label5-font
                0             Width: Label5-font
                0        Escapement: Label5-font
                0       Orientation: Label5-font
                700          Weight: Label5-font
                0           CharSet: Label5-font
                1      OutPrecision: Label5-font
                2     ClipPrecision: Label5-font
                1           Quality: Label5-font
                34   PitchAndFamily: Label5-font
                s" MS Sans Serif" SetFacename: Label5-font ;

Font Label6-font
: Set-Label6-font ( -- )
                -19          Height: Label6-font
                0             Width: Label6-font
                0        Escapement: Label6-font
                0       Orientation: Label6-font
                700          Weight: Label6-font
                0           CharSet: Label6-font
                1      OutPrecision: Label6-font
                2     ClipPrecision: Label6-font
                1           Quality: Label6-font
                34   PitchAndFamily: Label6-font
                s" MS Sans Serif" SetFacename: Label6-font ;

Font Label7-font
: Set-Label7-font ( -- )
                -19          Height: Label7-font
                0             Width: Label7-font
                0        Escapement: Label7-font
                0       Orientation: Label7-font
                700          Weight: Label7-font
                0           CharSet: Label7-font
                1      OutPrecision: Label7-font
                2     ClipPrecision: Label7-font
                1           Quality: Label7-font
                34   PitchAndFamily: Label7-font
                s" MS Sans Serif" SetFacename: Label7-font ;



:M ClassInit:   ( -- )
                ClassInit: super
                ;M

:M WindowStyle:  ( -- style )
                WindowStyle: SUPER
                ;M

:M WindowTitle: ( -- ztitle )
                z" ESP8266     2/4/2018  11:00:09"
                ;M

:M StartSize:   ( -- width height )
                928 745
                ;M

:M StartPos:    ( -- x y )
                50  35
                ;M

:M WM_COMMAND   ( h m w l -- res )
                over LOWORD ( ID ) self   \ object address on stack
                WMCommand-Func ?dup    \ must not be zero
                if          execute
                else        2drop   \ drop ID and object address
                then        0 ;M

:M SetCommand:  ( cfa -- )  \ set WMCommand function
                to WMCommand-Func
                ;M

:M On_Init:     ( -- )
                s" MS Sans Serif" SetFaceName: WinFont
                8 Width: WinFont
                Create: WinFont

                \ set form color to system color
                COLOR_BTNFACE Call GetSysColor NewColor: FrmColor

                \ FormInit-Functions:
                Load:ESP12-nodemcu-MINI
                Load:led-on21
                Load:led-off21
                Load:error

                self Start: Label3
                554 51 65 27 Move: Label3
                Set-Label3-font
                Create: Label3-font
                Handle: Label3-font SetFont: Label3
                s" TCP-IP" SetText: Label3

                self Start: Bitmap299
                106 78 447 628 Move: Bitmap299
                ESP12-nodemcu-MINI SetImage: Bitmap299


                self Start: STATIC12
                558 162 30 26 Move: STATIC12
                led-on21 SetImage: STATIC12


                self Start: GPIO16
                553 194 71 24 Move: GPIO16
                Handle: Winfont SetFont: GPIO16
                s" GPIO16" ToolString: GPIO16
                s" GPIO16" SetText: GPIO16

                self Start: GPIO5
                553 219 71 24 Move: GPIO5
                Handle: Winfont SetFont: GPIO5
                s" GPIO15" ToolString: GPIO5
                s" GPIO5" SetText: GPIO5

                self Start: GPIO4
                553 246 71 24 Move: GPIO4
                Handle: Winfont SetFont: GPIO4
                s" GPIO4" ToolString: GPIO4
                s" GPIO4" SetText: GPIO4

                self Start: GPIO0
                553 272 71 24 Move: GPIO0
                Handle: Winfont SetFont: GPIO0
                s" GPIO0" SetText: GPIO0

                self Start: GPIO2
                553 298 71 24 Move: GPIO2
                Handle: Winfont SetFont: GPIO2
                s" GPIO2" ToolString: GPIO2
                s" GPIO2" SetText: GPIO2

                self Start: Bitmap2
                432 193 26 25 Move: Bitmap2
                led-on21 SetImage: Bitmap2


                self Start: Label1
                233 32 212 37 Move: Label1
                Set-Label1-font
                Create: Label1-font
                Handle: Label1-font SetFont: Label1
                SS_CENTER +Style: Label1
                s" ESP8266" SetText: Label1

                self Start: Label2
                333 5 39 0 Move: Label2
                Handle: Winfont SetFont: Label2
                s" Label2" SetText: Label2

                self Start: Bitmap3
                432 218 26 25 Move: Bitmap3
                led-on21 SetImage: Bitmap3


                self Start: Bitmap4
                432 244 26 25 Move: Bitmap4
                led-on21 SetImage: Bitmap4


                self Start: Bitmap5
                432 270 26 25 Move: Bitmap5
                led-on21 SetImage: Bitmap5


                self Start: GPIO14
                553 376 71 24 Move: GPIO14
                Handle: Winfont SetFont: GPIO14
                s" GPIO14" ToolString: GPIO14
                s" GPIO14" SetText: GPIO14

                self Start: GPIO12
                553 402 71 24 Move: GPIO12
                Handle: Winfont SetFont: GPIO12
                s" GPIO12" ToolString: GPIO12
                s" GPIO12" SetText: GPIO12

                self Start: GPIO13
                553 428 71 24 Move: GPIO13
                Handle: Winfont SetFont: GPIO13
                s" GPIO13" ToolString: GPIO13
                s" GPIO13" SetText: GPIO13

                self Start: GPIO15
                553 454 71 24 Move: GPIO15
                Handle: Winfont SetFont: GPIO15
                s" GPIO15" ToolString: GPIO15
                s" GPIO15" SetText: GPIO15

                self Start: GPIO3
                553 480 71 24 Move: GPIO3
                Handle: Winfont SetFont: GPIO3
                s" GPIO3" ToolString: GPIO3
                s" GPIO3" SetText: GPIO3

                self Start: GPIO1
                553 506 71 24 Move: GPIO1
                Handle: Winfont SetFont: GPIO1
                s" GPIO1" ToolString: GPIO1
                s" GPIO1" SetText: GPIO1

                self Start: OUT4
                626 198 36 17 Move: OUT4
                Set-OUT4-font
                Create: OUT4-font
                Handle: OUT4-font SetFont: OUT4
                s" OUT4" SetText: OUT4

                self Start: ADC0
                35 197 71 24 Move: ADC0
                Handle: Winfont SetFont: ADC0
                s" ADC0" ToolString: ADC0
                s" ADC0" SetText: ADC0

                self Start: Button15
                35 223 71 24 Move: Button15
                Handle: Winfont SetFont: Button15
                s" Button15" SetText: Button15

                self Start: Button16
                35 249 71 24 Move: Button16
                Handle: Winfont SetFont: Button16
                s" Button16" SetText: Button16

                self Start: GPIO10
                35 275 71 24 Move: GPIO10
                Handle: Winfont SetFont: GPIO10
                s" GPIO10" ToolString: GPIO10
                s" GPIO10" SetText: GPIO10

                self Start: GPIO9
                35 301 71 24 Move: GPIO9
                Handle: Winfont SetFont: GPIO9
                s" GPIO9" ToolString: GPIO9
                s" GPIO9" SetText: GPIO9

                self Start: MOSI
                35 327 71 24 Move: MOSI
                Handle: Winfont SetFont: MOSI
                s" MOSI" ToolString: MOSI
                s" MOSI" SetText: MOSI

                self Start: CS
                35 353 71 24 Move: CS
                Handle: Winfont SetFont: CS
                s" CS" ToolString: CS
                s" CS" SetText: CS

                self Start: MISO
                35 378 71 24 Move: MISO
                Handle: Winfont SetFont: MISO
                s" MISO" ToolString: MISO
                s" MISO" SetText: MISO

                self Start: SCLK
                35 405 71 24 Move: SCLK
                Handle: Winfont SetFont: SCLK
                s" SCLK" ToolString: SCLK
                s" SCLK" SetText: SCLK

                self Start: ENAB
                35 478 71 24 Move: ENAB
                Handle: Winfont SetFont: ENAB
                s" ENAB" ToolString: ENAB
                s" ENAB" SetText: ENAB

                self Start: RST
                35 505 71 24 Move: RST
                Handle: Winfont SetFont: RST
                s" RST" ToolString: RST
                s" RST" SetText: RST

                self Start: Bitmap6
                433 296 26 25 Move: Bitmap6
                led-on21 SetImage: Bitmap6


                self Start: Bitmap7
                432 371 26 25 Move: Bitmap7
                led-on21 SetImage: Bitmap7


                self Start: Bitmap8
                432 396 26 25 Move: Bitmap8
                led-on21 SetImage: Bitmap8


                self Start: Bitmap9
                432 422 26 25 Move: Bitmap9
                led-on21 SetImage: Bitmap9


                self Start: Bitmap10
                432 446 26 25 Move: Bitmap10
                led-on21 SetImage: Bitmap10


                self Start: Bitmap11
                432 473 26 25 Move: Bitmap11
                led-on21 SetImage: Bitmap11


                self Start: Bitmap12
                433 499 26 25 Move: Bitmap12
                led-on21 SetImage: Bitmap12


                self Start: Bitmap13
                202 503 26 25 Move: Bitmap13
                led-on21 SetImage: Bitmap13


                self Start: Bitmap14
                202 480 26 25 Move: Bitmap14
                led-on21 SetImage: Bitmap14


                self Start: Bitmap15
                202 193 26 25 Move: Bitmap15
                led-on21 SetImage: Bitmap15


                self Start: Bitmap16
                202 219 26 25 Move: Bitmap16
                led-on21 SetImage: Bitmap16


                self Start: Bitmap17
                201 245 26 25 Move: Bitmap17
                led-on21 SetImage: Bitmap17


                self Start: Bitmap18
                201 269 26 25 Move: Bitmap18
                led-on21 SetImage: Bitmap18


                self Start: Bitmap19
                202 295 26 25 Move: Bitmap19
                led-on21 SetImage: Bitmap19


                self Start: Bitmap20
                202 320 26 25 Move: Bitmap20
                led-on21 SetImage: Bitmap20


                self Start: Bitmap21
                202 345 26 25 Move: Bitmap21
                led-on21 SetImage: Bitmap21


                self Start: Bitmap22
                203 370 26 25 Move: Bitmap22
                led-on21 SetImage: Bitmap22


                self Start: Bitmap23
                203 399 26 25 Move: Bitmap23
                led-on21 SetImage: Bitmap23


                self Start: IN16
                402 195 25 18 Move: IN16
                Handle: Winfont SetFont: IN16
                s" IN16" SetText: IN16

                self Start: IN5
                402 222 25 18 Move: IN5
                Handle: Winfont SetFont: IN5
                s" IN5" SetText: IN5

                self Start: OUT5
                626 223 37 17 Move: OUT5
                Set-OUT5-font
                Create: OUT5-font
                Handle: OUT5-font SetFont: OUT5
                s" OUT5" SetText: OUT5

                self Start: IN6
                402 247 25 18 Move: IN6
                Handle: Winfont SetFont: IN6
                s" IN6" SetText: IN6

                self Start: OUT7
                627 249 37 17 Move: OUT7
                Handle: Winfont SetFont: OUT7
                s" OUT7" SetText: OUT7

                self Start: Static1
                SS_REALSIZECONTROL +style: Static1
                led-off21 SetImage: Static1
                554 335 28 25 Move: Static1

                self Start: FileWindow1
                676 195 208 430 Move: FileWindow1


\  ===============================================
                self Start: Combo1
          \      678 631 211 29 Move: Combo1
                Handle: Winfont SetFont: Combo1
\  ===============================================

                self Start: Button23
                21 601 84 44 Move: Button23
                Set-Button23-font
                Create: Button23-font
                Handle: Button23-font SetFont: Button23
                s" COLD" SetText: Button23

                self Start: Label4
                592 83 27 24 Move: Label4
                Set-Label4-font
                Create: Label4-font
                Handle: Label4-font SetFont: Label4
                s" 2" SetText: Label4

                self Start: Label5
                592 163 27 24 Move: Label5
                Set-Label5-font
                Create: Label5-font
                Handle: Label5-font SetFont: Label5
                s" 8" SetText: Label5

                self Start: Label6
                592 112 27 24 Move: Label6
                Set-Label6-font
                Create: Label6-font
                Handle: Label6-font SetFont: Label6
                s" 4" SetText: Label6

                self Start: Label7
                592 139 27 24 Move: Label7
                Set-Label7-font
                Create: Label7-font
                Handle: Label7-font SetFont: Label7
                s" 6" SetText: Label7

                self Start: Bitmap28BUT
                553 599 69 47 Move: Bitmap28BUT
                error SetImage: Bitmap28BUT

                self Start: Combo2
            \    678 82 213 30 Move: Combo2
     678 82 213 105 Move: Combo2
                Handle: Winfont SetFont: Combo2

                self Start: Bitmap26
                558 135 30 26 Move: Bitmap26
                led-on21 SetImage: Bitmap26

                self Start: Bitmap27
                558 108 30 26 Move: Bitmap27
                led-on21 SetImage: Bitmap27

                self Start: Bitmap28
                558 82 30 26 Move: Bitmap28
                led-on21 SetImage: Bitmap28

                Close: FileWindow1
                \ FormInitialized-Functions:
                ;M

:M On_Paint:    ( -- )
                0 0 GetSize: self Addr: FrmColor FillArea: dc
                \ FormPaint-Function:
                ;M

:M On_Done:    ( -- )
                Delete: WinFont
                Delete: Label3-font
                Delete: Label1-font
                Delete: OUT4-font
                Delete: OUT5-font
                Delete: Button23-font
                Delete: Label4-font
                Delete: Label5-font
                Delete: Label6-font
                Delete: Label7-font
                ESP12-nodemcu-MINI call DeleteObject drop
                led-on21 call DeleteObject drop
                led-off21 call DeleteObject drop
                error call DeleteObject drop

                \ FormDone-Function:

                On_Done: super
                ;M

;Object

: Start  ( -- )
                start: ESP8266        ;

' Start alias ESP8266-Start

: Stop  ( -- )
                close: ESP8266        ;

' Stop alias ESP8266-Stop

 \ Not executable: noop SetFunc: Label3

' noop SetFunc: Bitmap299
' noop SetFunc: STATIC12

led-off21 value LED

: GPIO161  ( -- )
LED dup 2 Bitmap! led-off21 =
if   led-on21
else led-off21
then dup to LED 1 Bitmap!
;

' GPIO161 SetFunc: GPIO16

: GPIO151  ( -- )
LED dup 2 Bitmap! led-off21 =
if   led-on21
else led-off21
then dup to LED 1 Bitmap!
;

' GPIO151 SetFunc: GPIO5
' noop SetFunc: GPIO4
' NOOP  SetFunc: GPIO0
' NOOP  SetFunc: GPIO2
' noop SetFunc: Bitmap2

 \ Not executable: noop SetFunc: Label1

 \ Not executable: noop SetFunc: Label2

' noop SetFunc: Bitmap3
' noop SetFunc: Bitmap4
' noop SetFunc: Bitmap5

' NOOP SetFunc: GPIO14
' GPIO12 SetFunc: GPIO12
' GPIO13 SetFunc: GPIO13
' GPIO15 SetFunc: GPIO15
' GPIO3 SetFunc: GPIO3
' NOOP SetFunc: GPIO1

 \ Not executable: noop SetFunc: OUT4

' ADC0 SetFunc: ADC0



' GPIO10 SetFunc: GPIO10

' GPIO9 SetFunc: GPIO9

' MOSI SetFunc: MOSI

' CS SetFunc: CS



\  ' noop SetFunc: Button15
\ ' noop SetFunc: Button16


Load:led-on21
Load:led-off21


' Load:led-on21 SetFunc: Button15

' Load:led-off21  SetFunc: Button16



' noop SetFunc: Bitmap6
' noop SetFunc: Bitmap7
' noop SetFunc: Bitmap8
' noop SetFunc: Bitmap9
' noop SetFunc: Bitmap10
' noop SetFunc: Bitmap11
' noop SetFunc: Bitmap12
' noop SetFunc: Bitmap13
' noop SetFunc: Bitmap14
' noop SetFunc: Bitmap15
' noop SetFunc: Bitmap16
' noop SetFunc: Bitmap17
' noop SetFunc: Bitmap18
' noop SetFunc: Bitmap19
' noop SetFunc: Bitmap20
' noop SetFunc: Bitmap21
' noop SetFunc: Bitmap22
' noop SetFunc: Bitmap23

 \ Not executable: noop SetFunc: IN16
 \ Not executable: noop SetFunc: IN5
 \ Not executable: noop SetFunc: OUT5
 \ Not executable: noop SetFunc: IN6
 \ Not executable: noop SetFunc: OUT7
 \ Not executable: noop SetFunc: Static1
 \ Not executable: noop SetFunc: FileWindow1
 \ Not executable: noop SetFunc: Combo1

: COLD11  ( -- )
EMPTY
BEEP
BEEP
;
' COLD11 SetFunc: Button23

 \ Not executable: noop SetFunc: Label4

 \ Not executable: noop SetFunc: Label5

 \ Not executable: noop SetFunc: Label6

 \ Not executable: noop SetFunc: Label7


: switchLED  ( -- )
LED dup 3 Bitmap! led-off21 =
if   led-on21
else led-off21
then dup to LED 3 Bitmap!
;

\  ' switchLED SetFunc: Bitmap28BUT

 \ Not executable: noop SetFunc: Combo2

' noop SetFunc: Bitmap26

' noop SetFunc: Bitmap27






\ 2 constant: PIN
\ PIN GPIO_OUT gpio-mode
\ PIN GPIO_HIGH gpio-write
\ 250 ms
\ PIN GPIO_LOW gpio-write

needs telnet-peter2.f

: gpio101  27 emit  pt1  ;

 ' gpio101 SetFunc: ADC0


: gpio100   27 emit  pt6  ;
' GPIO100 SetFunc: GPIO10


: sock-open22 ( addr len port -- sock )
\ *G This opens up a new socket to a host name on a given port number \n
\ ** the host name will be looked up and the port number is converted implicitly \n
\ ** If the socket cannot be opened, a exception will be thrown.
  htons saddr 2 + w!
  AF_INET saddr w!
  host>iaddr saddr 4 + !
  0 SOCK_STREAM AF_INET socket dup
  16 saddr rot connect ;      \ abort" Unable to connect!" ;


 \   s" www.google.com" 80 sock-open

 \ s" www.google.com" 80 sock-open

\ : LOOKUP0   s" 192.168.1.100" 1983 telnet 1000 ms ;


: LP0   s" 192.168.1.100" 1983 sock-open22 .S ;
: LP1   s" 192.168.1.101" 1983 sock-open22 .S ;
: LP2   s" 192.168.1.102" 1983 sock-open22 .S ;
: LP3   s" 192.168.1.103" 1983 sock-open22 .S ;
: LP4   s" 192.168.1.104" 1983 sock-open22 .S ;
: LP5   s" 192.168.1.105" 1983 sock-open22 .S ;


: >boton  (  -- )                            \  : blink ( pin -- )
     dup
  ."  GPIO_OUT gpio-mode "
    ."  dup "
    ." GPIO_HIGH gpio-write "
    ."  250 ms  "
    ."  GPIO_LOW gpio-write "
    ." 250 ms "
;

\  : boton15  ."  2 blink  "   cr   ;     \    0  >boton   ;
\  : boton16   ."  0 blink "    cr   ;    \    1  >boton  ;

: telcr   (  -- )   13 telsend   10 telsend   ;

: boton15   s"  2 blink  "  teltype   telcr   ;          \     0  >boton   ;

: boton16   s"  0 blink  "  teltype   telcr   ;         \      teltype



\  ' MISO SetFunc: MISO
\  ' SCLK SetFunc: SCLK


 ' boton15  SetFunc: MISO

 ' boton16  SetFunc: SCLK


' ENAB SetFunc: ENAB

' RST SetFunc: RST



\  Zcount operates on an uncounted and null terminated string.
 \ ZCOUNT     ( str -- addr len ) \ null terminated string, whose 1rst char is at addr

\ : comunicate  ( --)     GetSelectedString: Combo2  cr   if zcount .s  cr type cr beep then  ;
\ : LOOKUP0   s" 192.168.1.100" 1983 telnet 1000 ms ;

: comunicate  ( --)     GetSelectedString: Combo2  cr   if zcount    2dup  cr type cr beep 1983  telnet 1000 ms  then  ;

\   :  gpio101  27 emit  pt1  ;
\  ' gpio101 SetFunc: ADC0
\  ' comunicate SetFunc: Bitmap28

' comunicate  SetFunc: Bitmap28BUT

: AddTextCombo1-2

z" 192.168.1.104"  AddstringTo:  Combo2
z" 192.168.1.105"  Addstringto:   Combo2
z" 192.168.1.106"  Addstringto:   Combo2

0 SetSelection: Combo2 ;




AddTextCombo1-2

START

AddTextCombo1-2


 \ Not executable: noop SetFunc: Label5

\ &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

\S

\ GetSelectedString: Combo1


: AddTextCombo1-1
z" Line 1"  AddstringTo: Combo1
z" Line 2"  Addstringto: Combo1
z" Line 3"  Addstringto: Combo1 ;



((
REQUIREMENTS :
: AddListTexts
AddTextList1-1
AddTextList1-2
AddTextMList1-1
AddTextMList1-2 ;
============================
AddListTexts
AddTextCombo1-1
AddTextCombo1-2
AddTextCmbList1-1
AddTextCmbList1-2
=============================


: (Start)  ( -- )
AddListTexts
AddTextCombo1-1
AddTextCombo1-2
AddTextCmbList1-1
AddTextCmbList1-2
;
' (Start) SetFunc: Button22


))









