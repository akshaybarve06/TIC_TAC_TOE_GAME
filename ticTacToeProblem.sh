#!/bin/bash -x

# @ Description: Tic Tac Toe Problem
# @ Author: Akshay Dhananjay Barve
# @ Version: 18.04.3 lts
# @ Since: 11 March 2020 / Wednesday

# Use Case 1

declare -A board

# Variables

noOfRows=3
noOfColumns=3

initializeBoard()
{
	for (( r=1; r<=$noOfRows; r++ ))
	do
		for ((c=1; c<=$noOfColumns; c++ ))
		do
			board[r,c]="+"
		done
	done
}

displayBoard()
{
	initializeBoard

	for (( r=1; r<=$noOfRows; r++ ))
	do
		echo "---------------"
		for (( c=1; c<=$noOfColumns; c++ ))
		do
			printf "| ${board[r,c]} |"
		done
		echo
	done
	echo "---------------"

}

displayBoard
