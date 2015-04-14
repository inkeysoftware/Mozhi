﻿/*	InKey script to provide a keyboard layout for Mozhi
      Autogenerated by InKeyKeyboardCreator 2.1.0

	Keyboard:	Mozhi
	Version:    1.08a
	Author:     InKey Software
	Official Distribution: http://inkeysoftware.com
	InKey Tutorial Page: http://inkeysoftware.com/tutorial

*/

;________________________________________________________________________________________________________________
; This section is required at the top of every InKey keyboard script:

K_MinimumInKeyLibVersion = 1.912
      ; The version number of the InKeyLib.ahki file that the keyboard developer used while writing this script.
      ; It can be found near the top of the InKeyLib.ahki file.
      ; It may be lower than the InKey version number.
      ; If a user has an older version of InKeyLib.ahki, he will need to update it in order to use this keyboard script.
      ; This protects your script from crashing from attempting to use functionality not present in older versions of InKeyLib.ahki.

K_UseContext = 2  ; Causes uncaptured character keys to be included in the context too. CAPS-sensitive.

#include InKeyLib.ahki
;________________________________________________________________________________________________________________

$_::InCase(Map("ക് ൿ", "ക ൿ"))
  ||InCase(Replace(Char(0x200C)) with(Char(0x200C))) ;To prevent repeated typing of ZWNJs
  ||Send(Char(0x200C)) ; Is this all the underscore does? (At least according to the KMN. There are other uses listed in the Layout image, but I think it actually refers to the old sequence for the Cillu)

$~::InCase(Map("ൻ ന്", "ൺ ണ്", "ർ ര്", "ൽ ല്", "ൾ ള്", "ൿ ക്"))
  ||InCase(After("[അ-ഹഺാ-ൌൗൠ-ൣ]") thenSend("്"))
  ||Beep()
  
$/::InCase(Replace("/") with("ഽ") elseSend("/"))

;The following rule is switch between Atomic and Sequence Chillu Characters
$\::InCase(Map("ൻ\ ന്‍", "ൺ\ ണ്‍", "ർ\ ര്‍", "ൽ\ ല്‍", "ൾ\ ള്‍", "ൿ\ ക്‍", "റ്റ്\ ഺ"))
  ||InCase(Map("ന്‍\ ൻ", "ണ്‍\ ൺ", "ര്‍\ ർ", "ല്‍\ ൽ", "ള്‍\ ൾ", "ക്‍\ ൿ", "ഺ\ റ്റ്"))
  ||Send("\")

$^::InCase(Map("ൻ ൹", "10 ൰", "100 ൱", "1000 ൲", "1/4 ൳", "1/2 ൴", "3/4 ൵") elseSend("^"))


$a::InCase(Map("ൻ ന", "ൺ ണ", "ർ ര", "ൽ ല", "ൾ ള", "ൿ ക", "ം മ", "ഋ റ"))
  ||InCase(Replace("്") with("$1")) ; workaround for InKey bug that doesn't like empty strings
  ||InCase(After("[ക-ഹ]") thenSend("ാ"))
  ||InCase(After("[ൺൻൽൿ]") Replace(char(0x200c)) with("അ"))  
  ||InCase(After("‍ാ") thenSend("‍ാ"))  ; attempts to allow multiple occurrences, but may render badly
  ||InCase(Map("അ ആ ആ‍ാ", "@ ാ") elseSend("അ"))

$+a::InCase(Map("് ാ", "ഋ റാ","@ ാ"))
  ||InCase(Replace("$F") with("$Rാ") usingMap("ൻ ന", "ൺ ണ", "ർ ര", "ൽ ല", "ൾ ള", "ൿ ക", "ം മ", "ഋ റ"))
  ||InCase(After("[ൺൻൽൿ]") Replace(char(0x200c)) with("ആ"))  
  ||Send("ആ")
  
$e::InCase(Replace("$F") with("$Rെ") usingMap("ൻ ന", "ൺ ണ", "ർ ര", "ൽ ല", "ൾ ള", "ൿ ക", "ം മ", "ഋ റ"))
  ||InCase(After("[ൺൻൽൿ]") Replace(char(0x200c)) with("എ"))
  ||InCase(Map("് െ ീ", "എ ഈ", "@ െ") elseSend("എ"))

$i::InCase(Replace("$F") with("$Rി") usingMap("ൻ ന", "ൺ ണ", "ർ ര", "ൽ ല", "ൾ ള", "ൿ ക", "ം മ", "ഋ റ"))
  ||InCase(After("[ക-ഹൺ-ൿ]") thenSend("ൈ"))
  ||InCase(After("[ൺൻൽൿ]") Replace(char(0x200c)) with("ഇ"))
  ||InCase(Map("് ി ീ", "ഇ ഈ", "അ ഐ", "@ ി", "ാ ൈ") elseSend("ഇ"))   

$o::InCase(Replace("$F") with("$Rൊ") usingMap("ൻ ന", "ൺ ണ", "ർ ര", "ൽ ല", "ൾ ള", "ൿ ക", "ം മ", "ഋ റ"))
  ||InCase(After("[ൺൻൽൿ]") Replace(char(0x200c)) with("ഒ"))
  ||InCase(Map("് ൊ ൂ", "ഒ ഊ", "@ ൊ") elseSend("ഒ"))  

$u::InCase(Replace("$F") with("$Rു") usingMap("ൻ ന", "ൺ ണ", "ർ ര", "ൽ ല", "ൾ ള", "ൿ ക", "ം മ", "ഋ റ"))
  ||InCase(After("[ക-ഹൺ-ൿ]") thenSend("ൗ"))  ; KMN uses 0d4c instead
  ||InCase(After("[ൺൻൽൿ]") Replace(char(0x200c)) with("ഉ"))
  ||InCase(Map("് ു ൂ", "ഉ ഊ", "അ ഔ", "ഒ ഔ", "@ ു", "ാ ൗ") elseSend("ഉ"))

$+e::InCase(Replace("$F") with("$Rേ") usingMap("ൻ ന", "ൺ ണ", "ർ ര", "ൽ ല", "ൾ ള", "ൿ ക", "ം മ", "ഋ റ"))
  ||InCase(After("[ൺൻൽൿ]") Replace(char(0x200c)) with("ഏ"))
  ||InCase(Map("് േ", "@ േ") elseSend("ഏ")) 

$+i::InCase(Replace("$F") with("$Rീ") usingMap("ൻ ന", "ൺ ണ", "ർ ര", "ൽ ല", "ൾ ള", "ൿ ക", "ം മ", "ഋ റ"))
  ||InCase(After("[ൺൻൽൿ]") Replace(char(0x200c)) with("ഐ"))
  ||InCase(Map("് ീ", "@ ീ") elseSend("ഐ")) 

$+o::InCase(Replace("$F") with("$Rോ") usingMap("ൻ ന", "ൺ ണ", "ർ ര", "ൽ ല", "ൾ ള", "ൿ ക", "ം മ", "ഋ റ"))
  ||InCase(After("[ൺൻൽൿ]") Replace(char(0x200c)) with("ഓ"))
  ||InCase(Map("് ോ", "@ ോ") elseSend("ഓ")) 

$+u::InCase(Replace("$F") with("$Rൂ") usingMap("ൻ ന", "ൺ ണ", "ർ ര", "ൽ ല", "ൾ ള", "ൿ ക", "ം മ", "ഋ റ"))
  ||InCase(After("[ൺൻൽൿ]") Replace(char(0x200c)) with("ഊ"))
  ||InCase(Map("് ൂ", "@ ൂ") elseSend("ഊ"))

$+r::InCase(Replace("$F") with("$Rൃ") usingMap("ൻ ന", "ൺ ണ", "ർ ര", "ൽ ല", "ൾ ള", "ൿ ക", "ം മ"))
  ||InCase(After("[ൺൻൽൿ]") Replace(char(0x200c)) with("ഋ"))
  ||InCase(Map("് ൃ ൄ", "@ ൃ", "ഋ ൠ") elseSend("ഋ"))
  
$l::InCase(After("[അ-ഷഹ]") Replace("ം") with("മ്ല്"))  ; After cons (except SA)
  ||InCase(After("[ൽൾൿ]") Replace(char(0x200c)) with("ല്"))
  ||InCase(Map("ൽ ല്ല്", "@ ൢ", "ൿ ക്ല്", "ൾ ഌ ൡ"))  ; "് ൢ ൣ", 
  ||InCase(Replace("$F") with("$Rൢ") usingMap("ൻ ന", "ൺ ണ", "ർ ര", "ൽ ല", "ൾ ള", "ം മ"))
  ||Send("ൽ")

$+l::InCase(After("[അ-ഷഹ]") Replace("ം") with("മ്ല്")) ; After cons (except SA)
  ||InCase(After("[ൻൽൾൿ]") Replace(char(0x200c)) with("ല്"))
  ||InCase(Map("ൾ ള്ള്", "ൻ ന്ല്", "ൽ ല്ല്", "ൿ ക്ല്")) 
  ||Send("ൾ")




$b::Send("ബ്")

$c::InCase(Map("ൿ ക്ക്"))
  ||InCase(After("ൿ") Replace(char(0x200c)) with("ക്"))
  ||Send("ൿ")

$d::InCase(Map("ൻ ന്ദ്"))
  ||InCase(After("ൻ") Replace(char(0x200c)) with("ദ്"))
  ||Send("ദ്")

$f::Send("ഫ്")

$g::InCase(Map("ൻ ങ്", "ന് ങ്") elseSend("ഗ്"))

$h::InCase(Map("ൻൿ ഞ്ച്", "ന്റ് ന്ത്", "ൿ ച്", "ക് ഖ്", "ക്ക് ച്ച്", "ഗ് ഘ്", "ച് ഛ്", "ജ് ഝ്", "ട് ഠ്", "ഡ് ഢ്", "റ്റ് ത് ഥ്", "ദ് ധ്", "പ് ഫ്", "ബ് ഭ്", "സ് ഷ്", "ശ് ഴ്"))
  ||Send("ഹ്")

$j::InCase(Map("ൻ ഞ്", "ന് ഞ്"))
  ||InCase(After("ൻ") Replace(char(0x200c)) with("ജ്"))
  ||Send("ജ്")

$k::InCase(Map("ൻ ങ്ക്", "ന് ങ്ക്", "ൿ ക്ക്"))
  ||InCase(After("[ൻൿ]") Replace(char(0x200c)) with("ക്"))
  ||Send("ക്")

$m::InCase(After("[അ-ഹഺാ-ൌൗൠ-ൣ]") thenSend("ം"))
  ||InCase(After("[ൺൻ]") Replace(char(0x200c)) with("മ്"))
  ||InCase(Map("ം മ്മ്", "ൺ ണ്മ്", "ൻ ന്മ്"))
  ||Send("മ്")

$n::InCase(After("[അ-ഷഹ]") Replace("ം") with("മ്ന്")) ; After cons (except SA)
  ||InCase(After("ൻ") Replace(char(0x200c)) with("ന്"))
  ||Incase(Replace("ൻ") with("ന്ന്"))
  ||Send("ൻ")

$p::InCase(Map("ം മ്പ്", "ൽ ല്പ്"))
  ||InCase(After("ൽ") Replace(Char(0x200c)) with("പ്"))
  ||Send("പ്")

$q::Send("ക്ക്")

$r::InCase(After("[അ-ഷഹ]") Replace("ം") with("മ്ര്")) ; After cons (except SA)
  ||InCase(After("ൻ") Replace(char(0x200c)) with("ര്"))
  ||InCase(After("ർ") Replace(char(0x200c)) with("റ്"))
  ||InCase(Map("ൻ ന്ര്", "ർ റ്"))
;  ||InCase(After("്") thenSend("്ര"))
  ||Send("ർ")

$s::Send("സ്")

$t::InCase(Map("റ്റ് ട്ട്", "ൻ ന്റ്", "ന് ന്റ്"))
  ||InCase(After("ൻ") Replace(char(0x200c)) with("റ്റ്"))
  ||Send("റ്റ്")

$v::
$w::InCase(Map("ൺ ണ്വ്", "ൻ ന്വ്", "ൽ ല്വ്", "ൿ ക്വ്"))
  ||InCase(After("[ൺൻൽൿ]") Replace(char(0x200c)) with("വ്"))
  ||Send("വ്")

$x::Send("ക്ഷ്")

$y::InCase(After("[അ-ഷഹാ-ൌൗൢൣ]") Replace("ം") with("മ്യ്")) ; After cons (except SA) or vowel signs
  ||InCase(Replace("$F") with("$R്യ്") usingMap("ൻ ന", "ൺ ണ", "ർ ര", "ൽ ല", "ൾ ള", "ൿ ക"))
  ||Send("യ്")

$z::Send("ശ്")


$+b::Send("ബ്ബ്")

$+c::Send("ച്ച്")

$+d::InCase(Map("ൺ ണ്ഡ്")) 
  ||InCase(After("ൺ") Replace(Char(0x200c)) with("ഡ്"))
  ||Send("ഡ്")

$+f::Send("ഫ്")

$+g::Send("ഗ്ഗ്")

$+h::Send("ഃ")

$+j::Send("ജ്ജ്")

$+k::Send("ക്ക്")

$+m::Send("മ്മ്") 

$+n::InCase(After("[അ-ഹഺാ-ൌൗൠ-ൣ]") thenSend("ൺ"))
  ||InCase(After("ൺ") Replace(char(0x200c)) with("ണ്"))
  ||InCase(Replace("ൺ") with("ണ്ണ്"))
  ||Send("ൺ")

$+p::Send("പ്പ്")

$+q::Send("ക്യു")

$+s::Send("ശ്")

$+t::InCase(Map("ൺ ണ്ട്"))
  ||InCase(After("ൺ") Replace(char(0x200c)) with("ട്"))
  ||Send("ട്")

$+v::Send("വ്വ്")

$+x::Send("ക്ഷ്")

$+y::Send("യ്യ്")

$+z::Send("ശ്ശ്")

$0::InCase(Map("\ ൦"))
  ||InCase(After("[൦-൯]") thenSend("൦"))
  ||Send("0")
  
$1::InCase(Map("\ ൧"))
  ||InCase(After("[൦-൯]") thenSend("൧"))
  ||Send("1")
  
$2::InCase(Map("\ ൨"))
  ||InCase(After("[൦-൯]") thenSend("൨"))
  ||Send("2")
  
$3::InCase(Map("\ ൩"))
  ||InCase(After("[൦-൯]") thenSend("൩"))
  ||Send("3")
  
$4::InCase(Map("\ ൪"))
  ||InCase(After("[൦-൯]") thenSend("൪"))
  ||Send("4")
  
$5::InCase(Map("\ ൫"))
  ||InCase(After("[൦-൯]") thenSend("൫"))
  ||Send("5")
  
$6::InCase(Map("\ ൬"))
  ||InCase(After("[൦-൯]") thenSend("൬"))
  ||Send("6")
  
$7::InCase(Map("\ ൭"))
  ||InCase(After("[൦-൯]") thenSend("൭"))
  ||Send("7")
  
$8::InCase(Map("\ ൮"))
  ||InCase(After("[൦-൯]") thenSend("൮"))
  ||Send("8")
  
$9::InCase(Map("\ ൯"))
  ||InCase(After("[൦-൯]") thenSend("൯"))
  ||Send("9")
  
