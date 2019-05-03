#!/bin/sh
if [ "$#" -lt 1 ]; then
echo "please provide at least 1 file"
fi

var1="0"
var2="0"
var3="0"
var4="0"
var5="0"
var6="0"

for each in $*
do 
echo ""
echo File = $each

while read line; do
env=`echo "$line" | cut -c6`
os=`echo "$line" | cut -c7`


if [ "$os" == 'w' ]; then
((var1++))
fi

if [ "$os" == 'l' ]; then 
((var2++)) 
fi

if [ "$os" != 'w' ] && [ "$os" != 'l' ]; then 
((var3++)) 
fi

if [ "$env" == 'p' ]; then 
((var4++)) 
fi

if [ "$env" == 'd' ]; then
((var5++))
fi

if [ "$env" != 'p' ] && [ "$env" != 'd' ]; then
((var6++))
fi

done < $each

echo "OS Windows = " $var1
echo "OS Linux   = " $var2
echo "OS Other   = " $var3
echo "Environment Production  = " $var4
echo "Environment Development = " $var5
echo "Environment Other       = " $var6
echo ""
var1="0"
var2="0"
var3="0"
var4="0"
var5="0"
var6="0"
done
