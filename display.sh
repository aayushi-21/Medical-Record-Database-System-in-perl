#!/bin/sh
val1=$( grep -i "$1" "record.txt"|awk -F, '{print $2}' )
echo "NAME : $val1"
val1=$( grep -i "$1" "record.txt"|awk -F, '{print $1}' )
echo "PATIENT ID : $val1"
val1=$( grep -i "$1" "record.txt"|awk -F, '{print $3}' )
echo "DOCTOR NAME: $val1"
val1=$( grep -i "$1" "record.txt"|awk -F, '{print $4}' )
echo "ADMITTED ON: $val1"
val1=$( grep -i "$1" "record.txt"|awk -F, '{print $5}' )
echo "PROBLEM: $val1"
val1=$( grep -i "$1" "record.txt"|awk -F, '{print $6}' )
echo "PROBLEM: $val1"
val1=$( grep -i "$1" "record.txt"|awk -F, '{print $7}' )
echo "GENDER: $val1"
val1=$( grep -i "$1" "record.txt"|awk -F, '{print $8}' )
echo "AGE GROUP: $val1"
 val1=$( grep -i "$1" "record.txt"|awk -F, '{print $9}' )
echo "MOBILE: $val1"
 val1=$( grep -i "$1" "record.txt"|awk -F, '{print $10}' )
echo "LOCALITY: $val1"
val1=$( grep -i "$1" "record.txt"|awk -F, '{print $11}' )
echo "BLOOD GROUP: $val1"
val1=$( grep -i "$1" "record.txt"|awk -F, '{print $12}' )
echo "TESTS CONDUCTED: $val1"
val1=$( grep -i "$1" "record.txt"|awk -F, '{print $13}' )
echo "TREATMENT: $val1"
 val1=$( grep -i "$1" "record.txt"|awk -F, '{print $14}' )
echo "TREATMENT PERIOD : $val1"

