#!/bin/bash 

a=4
b=5.6
c=$(echo "$a + $b" | bc) 
d="bash" 
e="/home/sasakovich"
f=$(hostname)

#OUTPUT SECTION 

echo "a = $a" 
echo "b = $b" 
echo "c = $c (a+b)" 
echo "d = $d" 
echo "e = $e" 
echo "f = $f" 

echo "$e"

 "DEBUG: a='$a', b='$b', c='$c'"
