#!/bin/bash -x

# @ Description: Tic Tac Toe Problem
# @ Author: Akshay Dhananjay Barve
# @ Version: 18.04.3 lts
# @ Since: 11 March 2020 / Wednesday

declare -A board

player="a"
turn=0
noOfRows=3
noOfColumns=3

initializeBoard(){
	for (( r=0; r<$noOfRows; r++ )); do
		for ((c=0; c<$noOfColumns; c++ ));	do
			board[$r,$c]="-"
		done
	done
}

displayBoard(){
	for (( r=0; r<$noOfRows; r++ )); do
		echo "---------------"
		for (( c=0; c<$noOfColumns; c++ )); do
			printf "[ ${board[$r,$c]} ]"
		done
		echo
	done
	echo "---------------"
}

letterAssign(){
		playerOne="X"
      playerTwo="O"
}

startToPlay(){
	letterAssign
	while [[ $turn -lt 9 && $isWon -eq 0 ]]
	do
	if [[ $(($turn%2)) -eq 0 ]]; then
		read -p "Player 1 Enter Position" position
		player=$playerOne
	else
		position=$(computerTurn)
		player=$playerTwo
	fi
	case $position in
	0)
		board[0,0]=$player;;
	1)
            board[0,1]=$player;;
         2)
            board[0,2]=$player;;
         3)
            board[1,0]=$player;;
         4)
            board[1,1]=$player;;
         5)
            board[1,2]=$player;;
         6)
            board[2,0]=$player;;
         7)
            board[2,1]=$player;;
         8)
            board[2,2]=$player;;
	*)
		echo Invalid Position
		((turn--))
	;;
	esac
	((turn++))
	checkWin
	displayBoard
	if [[ $player == X && $isWon -eq 1 ]]; then
 		echo "Player 1 Won.."
	elif [[ $player == O && $isWon -eq 1 ]]; then
 		echo "Player 2 (Computer) Won.."
	elif [[ $turn -eq 9 ]]; then
 		echo "Match Tied"
   	fi
	done
}

checkWin(){
	if [[ ${board[0,0]} == $player && ${board[0,1]} == $player &&  ${board[0,2]} == $player ]]; then
		isWon=1
	elif [[ ${board[1,0]} == $player && ${board[1,1]} == $player &&  ${board[1,2]} == $player ]]; then
      		isWon=1
	elif [[ ${board[2,0]} == $player && ${board[2,1]} == $player &&  ${board[2,2]} == $player ]]; then
      		isWon=1
	elif [[ ${board[0,0]} == $player && ${board[1,0]} == $player &&  ${board[2,0]} == $player ]]; then
      		isWon=1
	elif [[ ${board[0,1]} == $player && ${board[1,1]} == $player &&  ${board[2,1]} == $player ]]; then
      		isWon=1
	elif [[ ${board[0,2]} == $player && ${board[1,2]} == $player &&  ${board[2,2]} == $player ]]; then
      		isWon=1
	elif [[ ${board[0,0]} == $player && ${board[1,1]} == $player &&  ${board[2,2]} == $player ]]; then
      		isWon=1
	elif [[ ${board[0,2]} == $player && ${board[1,1]} == $player &&  ${board[2,0]} == $player ]]; then
      		isWon=1
	fi
	if [[ $turns -eq 9 ]]; then
	 echo "Match Tied"
	fi
}

computerTurn(){
		generatedNum=$((RANDOM%8))
		r=$(($generatedNum/3))
      		c=$(($generatedNum%3))
		if [[ ${board[$r,$c]} ==  X || ${board[$r,$c]} == O ]]; then
			computerTurn
		elif [[ ${board[$r,$c]} == - ]]; then
			cPosition=$generatedNum
		fi
	echo $cPosition
}

wantToPlay(){
   read -p "Would You Like To Start game Y/N ?" isStart
   if [[ $isStart == Y || $isStart == y ]]; then
	echo "Okay..Starting Game"
      	startToPlay
   else
      	echo "Exiting.."
			exit
   fi
}

initializeBoard
displayBoard
wantToPlay

