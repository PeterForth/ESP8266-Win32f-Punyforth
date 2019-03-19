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
 
For loading punyforth  is only a USB cable necessary, and a flasher
program. You
install  2 binaries in the lower part of memory, and 1 txt files
which is the forth part
and extensions of the dictionary (core+user program).
This is the  file wereyou place your programs,  at the end. 

For example there you will include a LCD driver, a I2c driver, a
server etc... you simply
append text to the core.forth  file, and save it as a new file.  When
you flash this to the  ESP8266 over USB, and make reset.
The punyforth binary, will open that file, and compile to its
dictionary in RAM, and run the
last word of this file which should be your program. If not, it  keeps
on the REPL  loop
(the forth interpreter) asking for new commands.
