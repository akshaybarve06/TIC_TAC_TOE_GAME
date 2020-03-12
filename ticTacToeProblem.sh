#!/bin/bash -x

# @ Description: Tic Tac Toe Problem
# @ Author: Akshay Dhananjay Barve
# @ Version: 18.04.3 lts
# @ Since: 11 March 2020 / Wednesday

declare -A gameBoard

playerOne="a"
playerTwoCPU="a"
player="a"
noOfTimePlay=0
cPosition=0
noOfRows=3
noOfColumns=3
temporaryVar=0

initializeBoard(){
	for (( r=0; r<$noOfRows; r++ )); do
		for ((c=0; c<$noOfColumns; c++ ));do
			gameBoard[$r,$c]="+"
		done
	done
}
displayBoard(){
	for (( r=0; r<$noOfRows; r++ )); do
		echo "---------------"
		for (( c=0; c<$noOfColumns; c++ )); do
			printf "[ ${gameBoard[$r,$c]} ]"
		done
		echo
	done
	echo "---------------"
}
toss()
{
	if [[ $((RANDOM%2)) -eq 0 ]]; then
		echo "Player1 Will Play First"
		startToPlay
	else
		echo "PlayerTwoCPU Will Play First"
		temporaryVar=1
		startToPlay
	fi
}
startToPlay(){
	playerOne="X"
	playerTwoCPU="O"

	while [[ $noOfTimePlay -lt 9 && $checkWinFlag -eq 0 ]]
	do
		if [[ $(($noOfTimePlay%2)) -eq $temporaryVar ]]; then
			read -p "Enter Your Choice ==>" position
			player=$playerOne
		else
			computerTurn
			checkWin $playerVariable
		fi
		((noOfTimePlay++))
		case $position in
		0)
			gameBoard[0,0]=$player;;
		1)
			gameBoard[0,1]=$player;;
		2)
			gameBoard[0,2]=$player;;
		3)
			gameBoard[1,0]=$player;;
		4)
			gameBoard[1,1]=$player;;
		5)
			gameBoard[1,2]=$player;;
		6)
			gameBoard[2,0]=$player;;
		7)
			gameBoard[2,1]=$player;;
		8)
			gameBoard[2,2]=$player;;
		esac
	displayBoard
	checkWin $player
done
}
checkWin(){
	local	player=$1

	if [[ ${gameBoard[0,0]} == $player && ${gameBoard[0,1]} == $player &&  ${gameBoard[0,2]} == $player ]]; then
		checkWinFlag=1
	elif [[ ${gameBoard[1,0]} == $player && ${gameBoard[1,1]} == $player &&  ${gameBoard[1,2]} == $player ]]; then
      		checkWinFlag=1
	elif [[ ${gameBoard[2,0]} == $player && ${gameBoard[2,1]} == $player &&  ${gameBoard[2,2]} == $player ]]; then
      		checkWinFlag=1
	elif [[ ${gameBoard[0,0]} == $player && ${gameBoard[1,0]} == $player &&  ${gameBoard[2,0]} == $player ]]; then
      		checkWinFlag=1
	elif [[ ${gameBoard[0,1]} == $player && ${gameBoard[1,1]} == $player &&  ${gameBoard[2,1]} == $player ]]; then
      		checkWinFlag=1
	elif [[ ${gameBoard[0,2]} == $player && ${gameBoard[1,2]} == $player &&  ${gameBoard[2,2]} == $player ]]; then
      		checkWinFlag=1
	elif [[ ${gameBoard[0,0]} == $player && ${gameBoard[1,1]} == $player &&  ${gameBoard[2,2]} == $player ]]; then
      		checkWinFlag=1
	elif [[ ${gameBoard[0,2]} == $player && ${gameBoard[1,1]} == $player &&  ${gameBoard[2,0]} == $player ]]; then
      		checkWinFlag=1
	fi
		if [[ $checkWinFlag -eq 1 ]]; then
			echo "$player Won.."
			displayBoard
			exit
		fi
}
computerTurn(){
<<<<<<< HEAD
		generatedNum=$((RANDOM%9))
		r=$(($generatedNum/3))
      c=$(($generatedNum%3))

		if [[ ${board[$r,$c]} ==  $playerOne || ${board[$r,$c]} == $playerTwo ]]; then
			computerTurn
		elif [[ ${board[$r,$c]} == + ]]; then
			checkBeforePlay
			echo $cPosition
=======
		checkWinBlockPlay
>>>>>>> UC7_checkWinThenPlayMove
			return
}
<<<<<<< HEAD
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
=======
checkWinBlockPlay(){
		playerVariable=$playerTwoCPU

		if [[ ${gameBoard[0,0]} == "$playerVariable"  && ${gameBoard[0,1]} == "$playerVariable" && ${gameBoard[0,2]} == "+" ]]; then
			gameBoard[0,2]=$playerTwoCPU
		elif [[ ${gameBoard[1,0]} == "$playerVariable"  && ${gameBoard[1,1]} == "$playerVariable" && ${gameBoard[1,2]} == "+" ]]; then
			gameBoard[1,2]=$playerTwoCPU
		elif [[ ${gameBoard[2,0]} == "$playerVariable"  && ${gameBoard[2,1]} == "$playerVariable" && ${gameBoard[2,2]} == "+" ]]; then
			gameBoard[0,2]=$playerTwoCPU

		elif [[ ${gameBoard[0,0]} == "$playerVariable"  && ${gameBoard[1,0]} == "$playerVariable" && ${gameBoard[2,0]} == "+" ]]; then
			gameBoard[2,0]=$playerTwoCPU
		elif [[ ${gameBoard[0,1]} == "$playerVariable"  && ${gameBoard[1,1]} == "$playerVariable" && ${gameBoard[2,1]} == "+" ]]; then
			gameBoard[2,2]=$playerTwoCPU
		elif [[ ${gameBoard[0,2]} == "$playerVariable"  && ${gameBoard[1,2]} == "$playerVariable" && ${gameBoard[2,2]} == "+" ]]; then
			gameBoard[2,2]=$playerTwoCPU

		elif [[ ${gameBoard[0,0]} == "$playerVariable"  && ${gameBoard[1,1]} == "$playerVariable" && ${gameBoard[2,2]} == "+" ]]; then
			gameBoard[2,2]=$playerTwoCPU
		elif [[ ${gameBoard[0,2]} == "$playerVariable"  && ${gameBoard[1,1]} == "$playerVariable" && ${gameBoard[2,0]} == "+" ]]; then
			gameBoard[2,0]=$playerTwoCPU

		elif [[ ${gameBoard[0,0]} == "+"  && ${gameBoard[0,1]} == "$playerVariable" && ${gameBoard[0,2]} == "$playerVariable" ]]; then
			gameBoard[0,0]=$playerTwoCPU
		elif [[ ${gameBoard[1,0]} == "+"  && ${gameBoard[1,1]} == "$playerVariable" && ${gameBoard[1,2]} == "$playerVariable" ]]; then
			gameBoard[1,0]=$playerTwoCPU
		elif [[ ${gameBoard[2,0]} == "+"  && ${gameBoard[2,1]} == "$playerVariable" && ${gameBoard[2,2]} == "$playerVariable" ]]; then
			gameBoard[2,0]=$playerTwoCPU

		elif [[ ${gameBoard[0,0]} == "+"  && ${gameBoard[1,0]} == "$playerVariable" && ${gameBoard[2,0]} == "$playerVariable" ]]; then
			gameBoard[0,0]=$playerTwoCPU
		elif [[ ${gameBoard[0,1]} == "+"  && ${gameBoard[1,1]} == "$playerVariable" && ${gameBoard[2,1]} == "$playerVariable" ]]; then
			gameBoard[0,1]=$playerTwoCPU
		elif [[ ${gameBoard[0,2]} == "+"  && ${gameBoard[1,2]} == "$playerVariable" && ${gameBoard[2,2]} == "$playerVariable" ]]; then
			gameBoard[0,2]=$playerTwoCPU

		elif [[ ${gameBoard[0,0]} == "+"  && ${gameBoard[1,1]} == "$playerVariable" && ${gameBoard[2,2]} == "$playerVariable" ]]; then
			gameBoard[0,0]=$playerTwoCPU
		elif [[ ${gameBoard[0,2]} == "+"  && ${gameBoard[1,1]} == "$playerVariable" && ${gameBoard[2,0]} == "$playerVariable" ]]; then
			gameBoard[0,2]=$playerTwoCPU

		elif [[ ${gameBoard[0,0]} == "$playerVariable"  && ${gameBoard[0,1]} == "+" && ${gameBoard[0,2]} == "$playerVariable" ]]; then
			gameBoard[0,1]=$playerTwoCPU
		elif [[ ${gameBoard[1,0]} == "$playerVariable"  && ${gameBoard[1,1]} == "+" && ${gameBoard[1,2]} == "$playerVariable" ]]; then
			gameBoard[1,2]=$playerTwoCPU
		elif [[ ${gameBoard[2,0]} == "$playerVariable"  && ${gameBoard[2,1]} == "+" && ${gameBoard[2,2]} == "$playerVariable" ]]; then
			gameBoard[2,1]=$playerTwoCPU

		elif [[ ${gameBoard[1,0]} == "$playerVariable"  && ${gameBoard[1,0]} == "+" && ${gameBoard[2,0]} == "$playerVariable" ]]; then
			gameBoard[2,0]=$playerTwoCPU
		elif [[ ${gameBoard[0,1]} == "$playerVariable"  && ${gameBoard[1,1]} == "+" && ${gameBoard[2,1]} == "$playerVariable" ]]; then
			gameBoard[1,1]=$playerTwoCPU
		elif [[ ${gameBoard[0,2]} == "$playerVariable"  && ${gameBoard[1,2]} == "+" && ${gameBoard[2,2]} == "$playerVariable" ]]; then
			gameBoard[1,2]=$playerTwoCPU

		elif [[ ${gameBoard[0,0]} == "$playerVariable"  && ${gameBoard[1,1]} == "+" && ${gameBoard[2,2]} == "$playerVariable" ]]; then
			gameBoard[1,1]=$playerTwoCPU
		elif [[ ${gameBoard[0,2]} == "$playerVariable"  && ${gameBoard[1,1]} == "+" && ${gameBoard[2,0]} == "$playerVariable" ]]; then
			gameBoard[1,1]=$playerTwoCPU
		else
			generatedNum=$((RANDOM%9))
      		r=$(($generatedNum/3))
      		c=$(($generatedNum%3))

      		if [[ ${gameBoard[$r,$c]} ==  $playerOne || ${gameBoard[$r,$c]} == $playerTwoCPU ]]; then
         		computerTurn
      		else
					gameBoard[$r,$c]=$playerTwoCPU
         		return
     			fi
>>>>>>> UC7_checkWinThenPlayMove
		fi
}

wantToPlay(){
   read -p "Would You Like To Start game Y/N ?" isStart
   if [[ $isStart == Y || $isStart == y ]]; then
		read -p "Would You Like To Toss..? Y/N " isToss
			if [[ $isToss == Y || $isToss == y ]]; then
				toss
			else
				echo "Okay..Starting Game"
      		startToPlay
			fi
   else
      	echo "Exiting.."
	exit
   fi
}
initializeBoard
displayBoard
wantToPlay
