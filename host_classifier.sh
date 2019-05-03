#!/bin/sh

if [ "$#" -lt 1 ]; then
        echo "please provide at least 1 file"
fi

for each in $*; do
        echo ""
        echo File = $each

        os_windows_count="0"
        os_linux_count="0"
        os_other_count="0"
        env_production_count="0"
        env_development_count="0"
        env_other_count="0"

while read line; do
        env=`echo "$line" | cut -c6`
        os=`echo "$line" | cut -c7`


if [ "$os" == 'w' ]; then
        ((os_windows_count++))
elif [ "$os" == 'l' ]; then
        ((os_linux_count++))
else
        ((os_other_count++))
fi

if [ "$env" == 'p' ]; then
        ((env_production_count++))
elif [ "$env" == 'd' ]; then
        ((env_development_count++))
else
        ((env_other_count++))
fi

done < $each

        echo "OS Windows = " $os_windows_count
        echo "OS Linux   = " $os_linux_count
        echo "OS Other   = " $os_other_count
        echo "Environment Production  = " $env_production_count
        echo "Environment Development = " $env_development_count
        echo "Environment Other       = " $env_other_count
        echo ""

done

