#!/bin/bash

for file_name in *.Z01; 
do
	yy=`echo $file_name | awk -F '.' '{print $2}' | cut -c5-6`
	if [ -d "./$yy" ]
	then
		echo "Directory $yy exists." 
	else
		mkdir $yy
	fi
	mm=`echo $file_name | awk -F '.' '{print $2}' | cut -c3-4`
	if [ -d "./$yy/$mm" ]
	then
		echo "Directory ./$yy/$mm exists."
	else
		mkdir -p ./$yy/$mm
	fi
	dd=`echo $file_name | awk -F '.' '{print $2}' | cut -c1-2`
	if [ -d "./$yy/$mm/$dd" ]
	then
		echo "Directory ./$yy/$mm/$dd exists."
	else
		mkdir -p ./$yy/$mm/$dd
	fi
	FTC=`echo $file_name |  awk -F '.' '{print $1}' | cut -c1-2`
	[ -d "./$yy/$mm/$dd/$FTC" ]
	then
		echo "Directory ./$yy/$mm/$dd/$FTC exists."
	else
		mkdir -p ./$yy/$mm/$dd/$FTC
	fi
	[ -e "./$yy/$mm/$dd/$FTC/$file_name" ]
	then
		echo "File ./$yy/$mm/$dd/$FTC/$file_name exists."
	else
	cp $file_name ./$yy/$mm/$dd/$FTC
	fi
done
