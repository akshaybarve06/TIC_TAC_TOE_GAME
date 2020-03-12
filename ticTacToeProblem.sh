#!/bin/bash -x

# @ Description: Tic Tac Toe Problem
# @ Author: Akshay Dhananjay Barve
# @ Version: 18.04.3 lts
# @ Since: 11 March 2020 / Wednesday

declare -A board

playerOne="a"
playerTwo="a"
player="a"
turn=0
cPosition=0
noOfRows=3
noOfColumns=3

initializeBoard(){
	for (( r=0; r<$noOfRows; r++ )); do
		for ((c=0; c<$noOfColumns; c++ ));do
			board[$r,$c]="+"
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

startToPlay(){
	playerOne="X"
	playerTwo="O"

	while [[ $turn -lt 9 && $checkWinFlag -eq 0 ]]
	do
	if [[ $(($turn%2)) -eq 0 ]]; then
		read -p "Enter Your Choice ==>" position
		player=$playerOne
	else
		position=$(computerTurn)
		echo "Computer's Choice ==>"$position
		player=$playerTwo
	fi
	((turn++))
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
	esac
	checkWin
	displayBoard
	done
}

checkWin(){
	if [[ ${board[0,0]} == $player && ${board[0,1]} == $player &&  ${board[0,2]} == $player ]]; then
		checkWinFlag=1
	elif [[ ${board[1,0]} == $player && ${board[1,1]} == $player &&  ${board[1,2]} == $player ]]; then
      		checkWinFlag=1
	elif [[ ${board[2,0]} == $player && ${board[2,1]} == $player &&  ${board[2,2]} == $player ]]; then
      		checkWinFlag=1
	elif [[ ${board[0,0]} == $player && ${board[1,0]} == $player &&  ${board[2,0]} == $player ]]; then
      		checkWinFlag=1
	elif [[ ${board[0,1]} == $player && ${board[1,1]} == $player &&  ${board[2,1]} == $player ]]; then
      		checkWinFlag=1
	elif [[ ${board[0,2]} == $player && ${board[1,2]} == $player &&  ${board[2,2]} == $player ]]; then
      		checkWinFlag=1
	elif [[ ${board[0,0]} == $player && ${board[1,1]} == $player &&  ${board[2,2]} == $player ]]; then
      		checkWinFlag=1
	elif [[ ${board[0,2]} == $player && ${board[1,1]} == $player &&  ${board[2,0]} == $player ]]; then
      		checkWinFlag=1
	fi
	if [[ $player == X && $checkWinFlag -eq 1 ]]; then
		echo "Player 1 Won.."
	elif [[ $player == O && $checkWinFlag -eq 1 ]]; then
		echo "Player 2 (Computer) Won.."
	elif [[ $turn -eq 9 ]]; then
		echo "Match Tied"
   	fi
}
computerTurn(){
		generatedNum=$((RANDOM%9))
		r=$(($generatedNum/3))
      c=$(($generatedNum%3))

		if [[ ${board[$r,$c]} ==  $playerOne || ${board[$r,$c]} == $playerTwo ]]; then
			computerTurn
		elif [[ ${board[$r,$c]} == + ]]; then
			checkBeforePlay
			echo $cPosition
			return
		fi
}
checkBeforePlay(){
		if [[ ${board[0,0]} == "$playerTwo"  && ${board[0,1]} == "$playerTwo" && ${board[0,2]} == "+" ]]; then
			board[0,2]=$playerTwo
		elif [[ ${board[1,0]} == "$playerTwo"  && ${board[1,1]} == "$playerTwo" && ${board[1,2]} == "+" ]]; then
			board[1,2]=$playerTwo
		elif [[ ${board[2,0]} == "$playerTwo"  && ${board[2,1]} == "$playerTwo" && ${board[2,2]} == "+" ]]; then
			board[0,2]=$playerTwo

		elif [[ ${board[0,0]} == "$playerTwo"  && ${board[1,0]} == "$playerTwo" && ${board[2,0]} == "+" ]]; then
			board[2,0]=$playerTwo
		elif [[ ${board[0,1]} == "$playerTwo"  && ${board[1,1]} == "$playerTwo" && ${board[2,1]} == "+" ]]; then
			board[2,2]=$playerTwo
		elif [[ ${board[0,2]} == "$playerTwo"  && ${board[1,2]} == "$playerTwo" && ${board[2,2]} == "+" ]]; then
			board[2,2]=$playerTwo

		elif [[ ${board[0,0]} == "$playerTwo"  && ${board[1,1]} == "$playerTwo" && ${board[2,2]} == "+" ]]; then
			board[2,2]=$playerTwo
		elif [[ ${board[0,2]} == "$playerTwo"  && ${board[1,1]} == "$playerTwo" && ${board[2,0]} == "+" ]]; then
			board[2,0]=$playerTwo

		elif [[ ${board[0,0]} == "+"  && ${board[0,1]} == "$playerTwo" && ${board[0,2]} == "$playerTwo" ]]; then
			board[0,0]=$playerTwo
		elif [[ ${board[1,0]} == "+"  && ${board[1,1]} == "$playerTwo" && ${board[1,2]} == "$playerTwo" ]]; then
			board[1,0]=$playerTwo
		elif [[ ${board[2,0]} == "+"  && ${board[2,1]} == "$playerTwo" && ${board[2,2]} == "$playerTwo" ]]; then
			board[2,0]=$playerTwo

		elif [[ ${board[0,0]} == "+"  && ${board[1,0]} == "$playerTwo" && ${board[2,0]} == "$playerTwo" ]]; then
			board[0,0]=$playerTwo
		elif [[ ${board[0,1]} == "+"  && ${board[1,1]} == "$playerTwo" && ${board[2,1]} == "$playerTwo" ]]; then
			board[0,1]=$playerTwo
		elif [[ ${board[0,2]} == "+"  && ${board[1,2]} == "$playerTwo" && ${board[2,2]} == "$playerTwo" ]]; then
			board[0,2]=$playerTwo

		elif [[ ${board[0,0]} == "+"  && ${board[1,1]} == "$playerTwo" && ${board[2,2]} == "$playerTwo" ]]; then
			board[0,0]=$playerTwo
		elif [[ ${board[0,2]} == "+"  && ${board[1,1]} == "$playerTwo" && ${board[2,0]} == "$playerTwo" ]]; then
			board[0,2]=$playerTwo

		elif [[ ${board[0,0]} == "$playerTwo"  && ${board[0,1]} == "+" && ${board[0,2]} == "$playerTwo" ]]; then
			board[0,1]=$playerTwo
		elif [[ ${board[1,0]} == "$playerTwo"  && ${board[1,1]} == "+" && ${board[1,2]} == "$playerTwo" ]]; then
			board[1,2]=$playerTwo
		elif [[ ${board[2,0]} == "$playerTwo"  && ${board[2,1]} == "+" && ${board[2,2]} == "$playerTwo" ]]; then
			board[2,1]=$playerTwo

		elif [[ ${board[1,0]} == "$playerTwo"  && ${board[1,0]} == "+" && ${board[2,0]} == "$playerTwo" ]]; then
			board[2,0]=$playerTwo
		elif [[ ${board[0,1]} == "$playerTwo"  && ${board[1,1]} == "+" && ${board[2,1]} == "$playerTwo" ]]; then
			board[1,1]=$playerTwo
		elif [[ ${board[0,2]} == "$playerTwo"  && ${board[1,2]} == "+" && ${board[2,2]} == "$playerTwo" ]]; then
			board[1,2]=$playerTwo

		elif [[ ${board[0,0]} == "$playerTwo"  && ${board[1,1]} == "+" && ${board[2,2]} == "$playerTwo" ]]; then
			board[1,1]=$playerTwo
		elif [[ ${board[0,2]} == "$playerTwo"  && ${board[1,1]} == "+" && ${board[2,0]} == "$playerTwo" ]]; then
			board[1,1]=$playerTwo
		else
			cPosition=$generatedNum
		fi
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
