#!/bin/bash

win_count=0
win_count2=0

experiment()
{
    for((i = 0; i < $1; i++)) {
        local prize=$(($RANDOM%3))
        local choice=$(($RANDOM%3))
        if [ $choice == $prize ]
        then
            win_count=`expr $win_count + 1`
        fi
    }
}

experiment2() 
{
    win_count2=0
    
    for((i = 0; i < $1; i++)) {
        local prize=$(($RANDOM%3))
        local choice=$(($RANDOM%3))
        
        if [ $choice == $prize ]
        then
            possible[0]=0
            possible[1]=1
            possible[2]=2
            possibilities=3
        else 
            possible[0]=$prize
            possible[1]=$choice
            possibilities=2
        fi

        choice=${possible[$(($RANDOM%possibilities))]}
        if [ $choice == $prize ]
        then
            ((win_count2 += 1))
        fi
    }
}

count=100
experiment $count
probability=$(($win_count * 100 / $count))
echo "experiment #1 probability: $probability"

experiment2 $count
probability2=$(($win_count2 * 100 / $count))
echo "experiment #2 probability: $probability2"
