#!/bin/sh
echo "enter the y or Y to start program and n/N for not starting"
read i
while [ "$i" = "y" ] ||  [ "$i" = "Y" ]
do
echo "1.View the total records "
echo "2.Add Records "
echo "3.Delete Records "
echo "4.Exit "
echo "Enter your choice "
read ch
    case $ch in
        1) echo "enter the name of patient"
		read v
		echo "----------------"
		echo "output"
		if grep -i "$v" "pname.txt"
		then ./display.sh "$v"
		 echo "record shown"
		else echo "not present"
		fi	;;
        2) echo "Enter the patient's id in 4 digits"
          read a
           echo "Enter patient's name "
          read b
          echo "Enter doctor's name:"
          read c
          echo "Enter the date of entry in format dd/mm/yyyy"
          read d
          echo "Enter the problem of the patient"
          read e
           echo "Enter the floor number less than 5"
          read f
           echo "Enter the gender"
          read g
	echo "enter the age group"
	echo "0-10 type child"
	echo "11-20 type teenager"
	echo "21-60 type adults"
	echo "61-above type old"
	read h
        echo "Enter the mobile no of 10 digits"
        read i
        echo "Enter the locality"
        read j
        echo "Enter the blood group"
        read k
	echo "enter the tests conducted"
	read z
	echo "enter the status of the problem as cured or in process"
	read y
	echo "enter approx/exact period of treatment"
	read x
          
          echo "$a,$b,$c,$d,$e,$f,$g,$h,$i,$j,$k,$z,$y,$x">>record.txt
		echo "$a" >> pid.txt
		echo "$b" >> pname.txt
		echo "$c" >> dname.txt
		echo "$d" >> doe.txt
		echo "$e" >> pop.txt
		echo "$f" >> fn.txt
		echo "$g" >> gd.txt
		echo "$h" >> age.txt
		echo "$i" >> mobile.txt
		echo "$j" >> local.txt
		echo "$k" >> blood.txt
		echo "$z" >> test.txt	
		echo "$y" >> status.txt
		echo "$x" >> time.txt;;
        3)echo "enter the name of the patient >"
	read pattern
	if grep -w -i "$pattern" "pname.txt";
	then
        grep -v -w -i "$pattern" record.txt > record2.txt
        echo "Record is deleted"
        cp record2.txt record.txt
	cut -d, -f 1 record2.txt > pid.txt
	cut -d, -f 2 record2.txt > pname.txt
        cut -d, -f 3 record2.txt > dname.txt
	cut -d, -f 4 record2.txt > doe.txt
	cut -d, -f 5 record2.txt > pop.txt
       	cut -d, -f 6 record2.txt > fn.txt
	cut -d, -f 7 record2.txt > gd.txt
	cut -d, -f 8 record2.txt > age.txt
	cut -d, -f 9 record2.txt > mobile.txt
	cut -d, -f 10 record2.txt > local.txt
	cut -d, -f 11 record2.txt > blood.txt
	cut -d, -f 12 record2.txt > test.txt
	cut -d, -f 13 record2.txt > status.txt
	cut -d, -f 14 record2.txt > time.txt
	else echo "record not present"
	fi;;           
        4)exit;;
        *)echo "Invalid choice ";;
    esac
echo "Do u want to continue ?(if yes then press y/Y and n/N for not proceeding"
read i
if [ "$i" != "Y" ] && [ "$i" != "y" ];
then
    exit
fi
done
