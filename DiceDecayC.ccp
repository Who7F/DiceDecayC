// DiceDecay.cpp : This file contains the 'main' function. Program execution begins and ends there.
// I am not a C programmer.  And this was written in a C++ IDE.  Apologies if this does not run in C
// This project is a conversion of a python project that simulated radioactive decay using simulated dice.
// The original project is someone else work

//#########################################
//include

#include <stdio.h>
#include <time.h>
#include <stdlib.h>
//##########################################

// diceDecay removes a dice when a 1 is rolled
// int so returns int
int diceDecay(int sidesDice, int numberDice) 
{
    int removeDice = 0;
    for (int i = 0; i < numberDice; i++)//for loop.  Rolls numberDice of dice
    {
        //rand() % sidesDice- random from 0 to sidesDice - 1
        //Note 0.  Count start a 0 in C.  So sideDice was 20.  
        //The count would count for 20, starting on 0, and ending on 19 
        if (rand() % sidesDice == 0)
        {
            removeDice++;//removeDice++ is the same removeDice = removeDice+1
        }        
    }
    return removeDice;
}

//Calls removeDice until there are 0 dice
//void so no retuen
void iteration(int sidesDice, int numberDice)
{
    while (numberDice > 0) //while loop
    {
        //The variables sidesDice is past through the iteration with out being modified 
        numberDice -= diceDecay(sidesDice, numberDice);//diceDecay returns the number of dice removed
        printf("%d", numberDice);//%d tells printf that numberDice is a int
        printf(",");
    }
}

//Calls iteration and reset numberDice
void repeater(int sidesDice, int numberDice, int repeats)
{
    for (int i = 0; i < repeats; i++)//for loop
    {
        printf("[");
        iteration(sidesDice, numberDice);
        printf("]");
    }
 
}

int main()
{    
    int sidesDice = 1000;
    int numberDice = 1000;
    int repeats = 20;
 
    srand(time(NULL));//rand is not random.  Using time to make it seem random
    //The variables numberDice sidesDice are both past through the repeater with out being modified 
    repeater(sidesDice, numberDice, repeats);  
}


