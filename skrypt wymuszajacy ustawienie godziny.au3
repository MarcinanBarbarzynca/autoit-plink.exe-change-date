#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

1. Zdobądź godzinę i datę
2. Rozpocznij plinka.exe

#ce ----------------------------------------------------------------------------

#include <Date.au3>
#include <Array.au3>
#include "plink_wrapper.au3"


while(1)

ConsoleWrite(_NowTime(5)& @CRLF)
ConsoleWrite(_NowDate()&@CRLF)
$data = (StringSplit(String(_NowDate()),"."))
$napis= ('"'&$data[3]&$data[2]&$data[1]&" "&_NowTime(5)&'"')
ConsoleWrite($napis&@CRLF)

$uchwyt_plinka =_Start_plink(@ScriptDir&"/plink.exe","10.186.10.2")
_Expect("login as:")
_Say("pi"&@LF)
_Expect("pi@10.186.10.2's password:"
_Say("polaski9"&@LF)
sleep(1000)
_Say("sudo date -s "&$napis&@LF)
sleep(1000)
_Plink_close()
sleep(3600*1000)
WEnd
