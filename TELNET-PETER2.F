\ TelNet Client
\ Thomas Dixon

needs sock.f            \ Socket Library

0 value tsock           \ socket handle
0 value tparam1
0 value tparam2
2variable oldcursor

\ special keys for telnet session
131081  value bkchar   \ break key
131078  value upchar
131079  value downchar
131076  value leftchar
131077  value rightchar


: telsend ( ch -- ) \ send a byte to the connection
  pad ! pad 1 tsock sock-write drop ;

: teltype ( str len -- ) \ write a string to the connection
  tsock sock-write drop ;

: telget ( -- ch ) \ get a byte from the connection
  pad 1 tsock sock-read drop pad c@  ;    \ -------------------------------------?:>?>


: teliac ( cmd -- ) \ interactive command dispatcher
  case
    253 of telget 252 255 telsend telsend telsend endof
    254 of telget 252 255 telsend telsend telsend endof
  endcase ;

: telparam ( -- )
  telget dup [char] 0 [char] 9 1+ within
  if [char] 0 - tparam1 10 * + to tparam1 recurse exit then
  case
    [char] ; of tparam1 to tparam2 0 to tparam1 recurse endof
    [char] J of page endof
    [char] H of tparam1 tparam2 at-xy endof
    [char] s of getxy oldcursor 2! endof
    [char] u of oldcursor 2@ at-xy endof
    [char] A of getxy tparam1 1 max - at-xy endof
    [char] B of getxy tparam1 1 max + at-xy endof
    [char] C of getxy swap tparam1 1 max + swap at-xy endof
    [char] D of getxy swap tparam1 1 max - swap at-xy endof
    [char] f of tparam1 tparam2 at-xy endof
  endcase ;

: telesc ( -- ) \ escape code dispatcher
  telget case
    [char] [ of telparam endof
    [char] H of tab endof
    [char] 7 of getxy oldcursor 2! endof
    [char] 8 of oldcursor 2@ at-xy endof
  endcase ;

: telchar ( ch -- ) \ handle an incoming byte
  dup 32 127 within if emit exit then
  case
     8   of 8  emit endof
     9   of tab endof
   \ 10  of 10 emit endof
   \  12  of page endof
  13  of  cr   endof    \  13 emit endof
   \  27  of 0 0 to tparam1 to tparam2 telesc endof
  \   255 of telget teliac endof
  endcase ;

: peCR  s" 2 10 tm "  teltype 13 telsend 10 telsend ;

: telnetloop ( -- ) \ main loop of telnet program
  begin tsock sock-closed? 0= while
    tsock sock-read? 0> if
      telget telchar
    else 1 ms then
    key? if
      key dup emit dup case
    10        of telsend 10 telsend cr endof
    13        of telsend 10 telsend cr endof
        27      of telsend 27 telsend exit endof
        bkchar    of drop exit endof
        upchar    of drop 27 telsend s" [1A" teltype endof
        downchar  of drop 27 telsend s" [1B" teltype endof
        leftchar  of drop 27 telsend s" [1C" teltype peCR endof  \ ======================
        rightchar of drop 27 telsend s" [1D" teltype endof

          telsend    \ any other  key  send
      endcase
    then
  repeat ;

: telnet ( addr len port -- ) \ open a telnet session
  sock-open to tsock
  telnetloop
  tsock sock-close drop ;

\ : ptelnet5   s" 192.168.1.105" 1983 telnet 1000 ms ;
: pt0   s" 192.168.1.100" 1983 telnet 1000 ms ;
: pt1   s" 192.168.1.101" 1983 telnet 1000 ms ;
: pt2   s" 192.168.1.102" 1983 telnet 1000 ms ;
: pt3   s" 192.168.1.103" 1983 telnet 1000 ms ;
: pt4   s" 192.168.1.104" 1983 telnet 1000 ms ;
: pt5   s" 192.168.1.105" 1983 telnet 1000 ms ;
: pt6   s" 192.168.1.106" 1983 telnet 1000 ms ;
: pt7   s" 192.168.1.107" 1983 telnet 1000 ms ;
: pt8   s" 192.168.1.108" 1983 telnet 1000 ms ;

\ : blinkpuny 2 20 tm  ;

: sock-open2 ( addr len port -- sock )
\ *G This opens up a new socket to a host name on a given port number \n
\ ** the host name will be looked up and the port number is converted implicitly \n
\ ** If the socket cannot be opened, a exception will be thrown.
  htons saddr 2 + w!
  AF_INET saddr w!
  host>iaddr saddr 4 + !
  0 SOCK_STREAM AF_INET socket dup
  16 saddr rot connect  ;   \ abort" Unable to connect!" ;

: scan9      ( -- 0 )  \  if it gives 0 is connected !
           s" 192.168.1.108" 1983  sock-open2 ( addr len port -- sock )    .s   ;

: scan8      ( -- 0 )  \  if it gives 0 is connected !
           s" 192.168.1.108" 1983  sock-open2 ( addr len port -- sock )    .s   ;

: scan7      ( -- 0 )  \  if it gives 0 is connected !
           s" 192.168.1.107" 1983  sock-open2 ( addr len port -- sock )    .s   ;

: scan6      ( -- 0 )  \  if it gives 0 is connected !
           s" 192.168.1.106" 1983  sock-open2 ( addr len port -- sock )    .s   ;

: scan5       ( -- 0 )  \  if it gives 0 is connected !
           s" 192.168.1.105" 1983  sock-open2 ( addr len port -- sock )    .s   ;

: scan4      ( -- 0 )  \  if it gives 0 is connected !
           s" 192.168.1.104" 1983  sock-open2 ( addr len port -- sock )    .s   ;

: scan3     ( -- 0 )  \  if it gives 0 is connected !
           s" 192.168.1.103" 1983  sock-open2 ( addr len port -- sock )    .s   ;

: scan2      ( -- 0 )  \  if it gives 0 is connected !
           s" 192.168.1.102" 1983  sock-open2 ( addr len port -- sock )    .s   ;

: scan1      ( -- 0 )  \  if it gives 0 is connected !
           s" 192.168.1.101" 1983  sock-open2 ( addr len port -- sock )    .s   ;

\ This works very similar to the command line utility
\ Examples:
\ s" myserver" 23 telnet

\ On the Internet ASCII Art:
\ s" towel.blinkenlights.nl" 23 telnet


