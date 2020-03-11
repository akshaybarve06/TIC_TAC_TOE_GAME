#!/bin/bash -x

# @ Description: Tic Tac Toe Problem
# @ Author: Akshay Dhananjay Barve
# @ Version: 18.04.3 lts
# @ Since: 11 March 2020 / Wednesday

declare -A board

noOfRows=3
noOfColumns=3

initializeBoard(){
	for (( r=1; r<=$noOfRows; r++ )); do
		for ((c=1; c<=$noOfColumns; c++ ));	do
			board[r,c]="+"
		done
	done
}

displayBoard(){
	for (( r=1; r<=$noOfRows; r++ )); do
		echo "---------------"
		for (( c=1; c<=$noOfColumns; c++ )); do
			printf "| ${board[r,c]} |"
		done
		echo
	done
	echo "---------------"
}

letterAssign(){
	if [[ $((RANDOM%2)) -eq 0 ]]; then
		playerOne=X
      PlayerTwo=O
      echo "Player1 ==> X"
      echo "Player2 ==> O"
	else
		playerOne=O
      PlayerTwo=X
      echo "Player1 ==> O"
      echo "Player2 ==> X"
	fi
}

toss(){
	if [[ $((RANDOM%2)) -eq 0 ]]; then
		echo "Player1 Will Play First"
	else
		echo "Player2 Will Play First"
	fi
}

wantToPlay(){
	read -p "Would You Like To Toss Y/N ?" isToss
	if [[ $isToss == Y || $isToss == y ]]; then
		toss
	else
		echo "Okay..Starting Game"
	fi
}

initializeBoard
displayBoard
letterAssign
wantToPlay
