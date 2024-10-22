#!/bin/bash
D=   #put number of the day here
DAY=0$D
DIR=D$D

for ((i=0; i<10; i++))
do
    mkdir "/home/jackoneill/Programming/s21/SQL/$DIR/src/ex0$i"
    cd "/home/jackoneill/Programming/s21/SQL/$DIR/src/ex0$i"
    touch "day"$DAY"_ex0$i.sql"
    cd ..
done

for ((i=10; i<14; i++))
do
    mkdir "/home/jackoneill/Programming/s21/SQL/$DIR/src/ex$i"
    cd "/home/jackoneill/Programming/s21/SQL/$DIR/src/ex$i"
    touch "day"$DAY"_ex$i.sql"
    cd ..
done
