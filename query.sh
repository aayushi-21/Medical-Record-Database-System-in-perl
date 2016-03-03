#!/bin/sh
echo "enter the choice y/Y to run a query and choice n/N for not running"
read i
while [ "$i" = "y" ] || [ "$i" = "Y" ]
do
echo "1.This query number takes input of disease and gives the names of corresponding patients "
echo "2.This query number takes input of doctor and shows the names of patients under him"
echo "3.This query number gives total number of female patients"
echo "4.This query number gives total number of male canditates"
echo "5.This query number takes patients name as input and displays its record"
echo "6.This query number gives the entry dates of the patient name entered"
echo "7.This  query number gives the list of dieases a person has"
echo "8.This query number gives the list of names of patients entered in same year"
echo "9.This query number takes the blood group and gender and returns names corresponding to them"
echo "10.This query number gives the names of patients in same locality"
echo "11.This query number gives the number of patients under the doctor name given as input"
echo "12.This query number gives the number of patients under the doctor and floor given as input "
echo "13.This query number gives number of patients of the blood group entered"
echo "14.This query number gives names of doctors dealing with the disease entered"
echo "15.This query number takes the date and gives the names of patients came on that entered date"
echo "16.This query number takes the name of the age group and tells the number of patients visited"
echo "17.This query number takes the patient name and tells on floor which he is present or was present"
echo "18.This query number takes the month number and year and tells number of patients in this month"
echo "19.This query number gives the number of univeral donors"
echo "20.This query number gives the number of univeral acceptors" 
echo "21.This query number takes the name of the patient and tells the status of treatment"
echo "22.This query number takes the status and tells the patient id with name"
echo "23.This query number gives the number of total patients in each age group"
echo "24.This query number gives the number of tests conducted for the test name given as input"
echo "25.This query number takes the input of name of person whose patient id and mobile is to be known"
echo "26.This query number tells the names of doctors who are child specialist"
echo "27.This query number takes the disease name and tells the patients name having this disease and days spent by them "
echo "28.This query number mobile numbers starting with 9"
echo "29.This query number gives the patient names ending with a"
echo "30.This query number takes the name of age group and returns the patient names,disease name and days spent"
echo "enter the query number"
read ch
    case $ch in
        1) echo "enter the disease name"
		read disease
		echo "-----------"
		echo "output"
		if grep -i "$disease" "pop.txt" ;
		then echo "patients are ->" 
		grep -i "$disease" "record.txt" | awk -F, '{ print $2 }' 
		else echo "no patient having such disease"
		fi;;
        2) echo "enter the doctor's name"
		read name
		echo "-----------"
		echo "output"
		if grep -i "$name" "dname.txt";
		then echo "patients are ->"
	 grep -i "$name" "record.txt"|awk -F, '$3'| awk -F, '{ print $2 }'
		else echo "No such doctor is there"
		fi;;
        3) if grep -i "female" "gd.txt";
		then echo "female patients are->"
		grep -i "female" "record.txt" | awk -F, '{ print $2 }'
		else echo "no patient of this gender"
		fi;;         
        4) 
		echo "-----------"
		echo "output"
		if grep -w -i "male" "gd.txt";
		then echo "male patients are->"
		grep -w -i "male" "record.txt" | awk -F, '{ print $2 }'
		else echo "no patient of this gender"
		fi;; 
	5)echo "enter the patient's name"
		read patient
		echo "-----------"
		echo "output"
		if grep -i "$patient" "pname.txt";
		then 
		./display.sh "$patient"
		else echo "no such patient is there"
		fi ;;
	6)echo "enter the patient's name"
	        read name
		echo "-----------"
		echo "output"
		if grep -i "$name" "pname.txt" ;
		then echo "entry dates are ->"
		grep -i "$name" "record.txt" | awk -F, '{print $4}'
		else echo "no record for such name exists"
		fi;;
	7)echo "enter the patient's name"
		read name
		echo "-----------"
		echo "output"
		if grep -i "$name" "pname.txt" ;
		then
		grep -i "$name" "record.txt" | awk -F, '{print $5}'
		else echo "no record for such name exists"
		fi;;
	8)echo "enter the year"
		read year
		echo "-----------"
		echo "output"
		if grep "/$year" "doe.txt";
		then
		grep -c "/$year" "doe.txt"
		else echo "not present"
		fi;;
	9)echo "enter the blood group and gender to get the name"
		read a
		read b
		echo "-----------"
		echo "output"
		echo "the names are>"
		if grep -w -i "$a" "record.txt"| grep -w "$b";
		then echo "patient names are ->"		
		grep -w -i "$a" "record.txt"| grep -w -i "$b"|awk -F, '{print $2}'
		else echo "match not found"
		fi;;
	10)echo "enter the locality"
		read locality
		echo "-----------"
		echo "output"
		if grep -i "$locality" "local.txt"; 
		then echo "patient names are->"
		grep -i "$locality" "record.txt" |awk -F, '{print $2}'
		else echo "no such locality's name in record"
		fi;;
	11)echo "enter the doctor's name"
		read name
		echo "-----------"
		echo "output"
		if grep -i "$name" "dname.txt";
		then echo "number of patients are"
		grep -c -i "$name" "record.txt"
		else echo "no such record exists"
		fi;;
	12) echo "enter the name of doctor"
		read a
		echo "enter the floor"
		read b 
		echo "-----------"
		echo "output"
		if grep -i "$a" "record.txt"|grep -w -i "$b" ;
		then echo "patient names are->"
	grep -i "$a" "record.txt"|grep -w -i "$b"|awk -F, '{print $2}'
		else echo "match not found"
		fi;;
	13) echo "enter the blood group"
		read a
		echo "-----------"
		echo "output"
		if grep -i "$a" "blood.txt";
		then echo "number of patients ->"
		grep -c -i "$a" "record.txt"
		else echo "does not exist"
		fi;;
	14) echo "enter the disease name"
		read a
		echo "-----------"
		echo "output"
		if grep -i "$a" "pop.txt";
		then echo "the doctors are->"
		grep -i "$a" "record.txt"| awk -F, '{print $3}'
		else echo "invalid disease name"
		fi;;
	15) echo "enter the date"
		read a
		echo "-----------"
		echo "output"
		if grep -w "$a" "doe.txt";
		then echo "the patients are ->"
		grep -w "$a" "record.txt"|awk -F, '{printf $2}'
		else echo "no entry on this date"
		fi;;
	16) echo "enter the age group name"
		read a
		echo "-----------"
		echo "output"
		if grep -i "$a" "age.txt";
		then
		echo "number of patients visited of this age group are"
		grep -c -i -w "$a" "age.txt"
		else echo "invalid age group name or not present"
		fi;;
	17)echo "enter the name of the patient"
		read a
		echo "-----------"
		echo "output"		
		if grep  -i "$a" "pname.txt";
		then echo "the floor number is"
		grep -i "$a" "record.txt" |awk -F, '{print $6}'
		else echo "invalid record"
		fi;;
	18) echo "enter the month number"
		read a
		echo "enter the year"
		read b
		echo "-----------"
		echo "output"
		if grep "/$a/$b" "doe.txt";
		then echo "number of patients are"
		grep -c "/$a/$b" "record.txt"
		else echo "no patient in this month and year"
		fi;;
	19) echo "-----------"
		echo "output"
		echo "number of universal donors are>"
		grep -i -c "o+" "record.txt";;
	20) echo "-----------"
		echo "output"
		echo "number of universal acceptors are>"
		grep -i -c "ab-" "record.txt";;
	21)echo "enter the patient name"
		read a
		echo "-----------"
		echo "output"
		if grep  -i "$a" "pname.txt";
		then echo "the status of treatment is->"
		grep -i "$a" "record.txt" | awk -F, '{print $13}'
		else echo "invalid record"
		fi;;
	22)echo "enter the status of treatment"
		read a
		echo "-----------"
		echo "output"
		if grep -i -w "$a" "status.txt";
		then echo 
		grep -i -w "$a" "record.txt"|awk -F, '{print $1,$2}'
		else
		echo "invalid status"
		fi;;
	23) 
		echo "-----------"
		echo "output"
		echo "child" 
		grep -c "child" "record.txt"
		echo "teenager" 
		grep -c "teenage" "record.txt" 
	        echo "old" 
		grep -c "old" "record.txt"
		echo "adlut" 
		grep -c "adult" "record.txt";;
	24)echo "enter the test name"
		read a
		echo "-----------"
		echo "output"
		if grep -w -i "$a" "test.txt";
		then grep -c -i "$a" "record.txt"
		else echo "invalid test name"
		fi ;;
	25) echo "enter the patient name"
		read a
		echo "-----------"
		echo "output"
		if grep -i "$a" "pname.txt";
		then grep -i "$a" "record.txt"|awk -F, '{print $1,$2,$9}'
		else echo "invalid test name"
		fi ;;
	26)  echo "-----------"
		echo "output"
		if grep -w -i "child" "age.txt";
		then
		grep -w -i "child" "record.txt"|awk -F, '{print $3}'
		else echo "not present"
		fi;;
	27) echo "enter the disease name"
		read a
		echo "-----------"
		echo "output"
		if grep -i "$a" "pop.txt";
		then grep -i "$a" "record.txt"|awk -F, '{print $2,$14}'
		else echo "not in record"
		fi;;
	28) echo "-----------"
		echo "output"
		if grep "^9" "mobile.txt";
		then
		grep "^9" "mobile.txt"
		else echo "not present"
		fi;;
	29) echo "-----------"
		echo "output"
		if grep -i "a$" "pname.txt";
		then
		grep -i "a$" "pname.txt"
		else echo "not present"
		fi;;
	30)  echo "-----------"
		echo "output"
		echo "enter the age group "
		read a
		if grep -i -w "$a" "age.txt"
		then 
		grep -i -w "$a" "record.txt"|awk -F, '{print $2,$5,$14}'
		else echo "invalid"
		fi;;
        *)echo "Invalid choice ";;
    esac
echo "Do u want to continue ?(if yes then enter y and if no then press n)"
read i
if [ "$i" != "y" ] && [ "$i" != "Y" ]
then
    exit 
fi

done
