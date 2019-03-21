# ESP8266-Win32f-Punyforth
my work with Nodemcu Punyforth and Win32forth 
This program is a graphical front-end with buttons
that I can program from Win32forth to include simple commands or full
forth programs and call them visually.
It was created on VisualForth,
then I updated  the code in w32forth-IDE on the parts  it was necessary.

On the ESP8266 side you have Punyforth. There are many explanations how to use
it and download it to the  ESP8266 Nodemcu,  and also  videos
steering a tank, controlling a water boiler, etc...  The good thing of the
ESP8266 that you can run it on 2 AA cells, its size, and it costs is low 4U$S
or less.
It took me some time to learn how to install Punyforth from Windows, since all
the explanations are for Linux.
 
For loading punyforth you need only a USB cable, a flasher program, and the punyforth binaries. 
You need to create and install the 2 binaries in the lower part of memory, and 1 txt files
which is the forth part and extensions of the dictionary (core+user program).
This is the  file were you place your programs, at the end of it. 

For example if you need for your project to  include a LCD driver, a I2c driver, a
server etc... you simply append text to the core.forth  file, and save it as a new file. 
When you flash this to the  ESP8266 over USB, and make reset.
The punyforth binary, will open that file, and compile to its
dictionary in RAM, and run the
last word of this file which should be your program run or main word. If not, it  keeps
on the REPL  loop (the forth interpreter) asking for new commands, like any normal forth.
Watch my video :
https://www.youtube.com/watch?v=NvZHxFj0pt8

Special Thanks to Tom Zimmer and FIG Forth contributors who did possible :  Win32forth , 
and to Attila Magyar for his fantastic Punyforth for Nodemcu, and to Dirk Bruehl for his VisualForth extensions.

![Wi32forth->Punyforth Screenshot](https://github.com/PeterForth/ESP8266-Win32f-Punyforth/blob/master/screen-w32f-punyforth9_n.jpg)


Recommendation :

To compile without errors, use any Win32forth version above 6.15 , this is my screen after loading
the program in  Win32forth version  6.15.04.

To communicate with Nodemcu you can modify  the Droplist LP0 to LP5 definitions at line 900
the range is set-up for mine to 192.168.100 up to  105,  you can edit this values to accomodate yours IPs
After choosing the right IP from the Droplist, press the red button with the cross in the bottom
of the screen, and communication link over Telnet will be established with your nodemcu.

![Wi32forth->Punyforth Screenshot](https://github.com/PeterForth/ESP8266-Win32f-Punyforth/blob/master/win32f61504.jpg)
