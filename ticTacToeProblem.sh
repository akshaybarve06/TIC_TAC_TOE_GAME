#!/bin/bash -x

# @ Description: Tic Tac Toe Problem
# @ Author: Akshay Dhananjay Barve
# @ Version: 18.04.3 lts
# @ Since: 12 March 2020 / Wednesday

declare -A gameBoard

player="a"
noOfTimePlay=0
noOfRows=3
noOfColumns=3
temporaryVar=0
playerOne="X"
playerTwoCPU="O"

initializeBoard(){
	for (( r=0; r<$noOfRows; r++ )); do
		for ((c=0; c<$noOfColumns; c++ ));do
			gameBoard[$r,$c]="+"
		done
	done
	echo "Player1 ==> X"
	echo "Player2 ==> O"
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
	while [[ $noOfTimePlay -lt 9 && $checkWinFlag -eq 0 ]]
	do
		if [[ $(($noOfTimePlay%2)) -eq $temporaryVar ]]; then
			read -p "Enter Your Choice ==>" position
			player=$playerOne
		else
			echo "Computer's Turn"
			computerTurn
			checkWin $playerTwoCPU
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
	local player=$1

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
		if [[ $player == X && $checkWinFlag -eq 1 ]]; then
			echo "Player1 Won.."
			displayBoard
			exit
		elif [[ $player == O && $checkWinFlag -eq 1 ]]; then
         	echo "Player2 CPU Won.."
         	displayBoard
         	exit
		elif [[ $noOfTimePlay -eq 9 ]]; then
			echo "Match Tied.."
		fi
}
computerTurn(){
				checkWinBlockPlay
				return
}
checkWinBlockPlay(){

		if [[ ${gameBoard[0,0]} == "$playerTwoCPU"  && ${gameBoard[0,1]} == "$playerTwoCPU" && ${gameBoard[0,2]} == "+" ]]; then
			gameBoard[0,2]=$playerTwoCPU
			return
		elif [[ ${gameBoard[1,0]} == "$playerTwoCPU"  && ${gameBoard[1,1]} == "$playerTwoCPU" && ${gameBoard[1,2]} == "+" ]]; then
			gameBoard[1,2]=$playerTwoCPU
			return
		elif [[ ${gameBoard[2,0]} == "$playerTwoCPU"  && ${gameBoard[2,1]} == "$playerTwoCPU" && ${gameBoard[2,2]} == "+" ]]; then
			gameBoard[2,2]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,0]} == "$playerTwoCPU"  && ${gameBoard[1,0]} == "$playerTwoCPU" && ${gameBoard[2,0]} == "+" ]]; then
			gameBoard[2,0]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,1]} == "$playerTwoCPU"  && ${gameBoard[1,1]} == "$playerTwoCPU" && ${gameBoard[2,1]} == "+" ]]; then
			gameBoard[2,1]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,2]} == "$playerTwoCPU"  && ${gameBoard[1,2]} == "$playerTwoCPU" && ${gameBoard[2,2]} == "+" ]]; then
			gameBoard[2,2]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,0]} == "$playerTwoCPU"  && ${gameBoard[1,1]} == "$playerTwoCPU" && ${gameBoard[2,2]} == "+" ]]; then
			gameBoard[2,2]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,2]} == "$playerTwoCPU"  && ${gameBoard[1,1]} == "$playerTwoCPU" && ${gameBoard[2,0]} == "+" ]]; then
			gameBoard[2,0]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,0]} == "+"  && ${gameBoard[0,1]} == "$playerTwoCPU" && ${gameBoard[0,2]} == "$playerTwoCPU" ]]; then
			gameBoard[0,0]=$playerTwoCPU
			return
		elif [[ ${gameBoard[1,0]} == "+"  && ${gameBoard[1,1]} == "$playerTwoCPU" && ${gameBoard[1,2]} == "$playerTwoCPU" ]]; then
			gameBoard[1,0]=$playerTwoCPU
			return
		elif [[ ${gameBoard[2,0]} == "+"  && ${gameBoard[2,1]} == "$playerTwoCPU" && ${gameBoard[2,2]} == "$playerTwoCPU" ]]; then
			gameBoard[2,0]=$playerTwoCPU
			return

		elif [[ ${gameBoard[0,0]} == "+"  && ${gameBoard[1,0]} == "$playerTwoCPU" && ${gameBoard[2,0]} == "$playerTwoCPU" ]]; then
			gameBoard[0,0]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,1]} == "+"  && ${gameBoard[1,1]} == "$playerTwoCPU" && ${gameBoard[2,1]} == "$playerTwoCPU" ]]; then
			gameBoard[0,1]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,2]} == "+"  && ${gameBoard[1,2]} == "$playerTwoCPU" && ${gameBoard[2,2]} == "$playerTwoCPU" ]]; then
			gameBoard[0,2]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,0]} == "+"  && ${gameBoard[1,1]} == "$playerTwoCPU" && ${gameBoard[2,2]} == "$playerTwoCPU" ]]; then
			gameBoard[0,0]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,2]} == "+"  && ${gameBoard[1,1]} == "$playerTwoCPU" && ${gameBoard[2,0]} == "$playerTwoCPU" ]]; then
			gameBoard[0,2]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,0]} == "$playerTwoCPU"  && ${gameBoard[0,1]} == "+" && ${gameBoard[0,2]} == "$playerTwoCPU" ]]; then
			gameBoard[0,1]=$playerTwoCPU
			return
		elif [[ ${gameBoard[1,0]} == "$playerTwoCPU"  && ${gameBoard[1,1]} == "+" && ${gameBoard[1,2]} == "$playerTwoCPU" ]]; then
			gameBoard[1,1]=$playerTwoCPU
			return
		elif [[ ${gameBoard[2,0]} == "$playerTwoCPU"  && ${gameBoard[2,1]} == "+" && ${gameBoard[2,2]} == "$playerTwoCPU" ]]; then
			gameBoard[2,1]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,0]} == "$playerTwoCPU"  && ${gameBoard[1,0]} == "+" && ${gameBoard[2,0]} == "$playerTwoCPU" ]]; then
			gameBoard[1,0]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,1]} == "$playerTwoCPU"  && ${gameBoard[1,1]} == "+" && ${gameBoard[2,1]} == "$playerTwoCPU" ]]; then
			gameBoard[1,1]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,2]} == "$playerTwoCPU"  && ${gameBoard[1,2]} == "+" && ${gameBoard[2,2]} == "$playerTwoCPU" ]]; then
			gameBoard[1,2]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,0]} == "$playerTwoCPU"  && ${gameBoard[1,1]} == "+" && ${gameBoard[2,2]} == "$playerTwoCPU" ]]; then
			gameBoard[1,1]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,2]} == "$playerTwoCPU"  && ${gameBoard[1,1]} == "+" && ${gameBoard[2,0]} == "$playerTwoCPU" ]]; then
			gameBoard[1,1]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,0]} == "$playerOne"  && ${gameBoard[0,1]} == "$playerOne" && ${gameBoard[0,2]} == "+" ]]; then
			gameBoard[0,2]=$playerTwoCPU
			return
		elif [[ ${gameBoard[1,0]} == "$playerOne"  && ${gameBoard[1,1]} == "$playerOne" && ${gameBoard[1,2]} == "+" ]]; then
			gameBoard[1,2]=$playerTwoCPU
			return
		elif [[ ${gameBoard[2,0]} == "$playerOne"  && ${gameBoard[2,1]} == "$playerOne" && ${gameBoard[2,2]} == "+" ]]; then
			gameBoard[2,2]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,0]} == "$playerOne"  && ${gameBoard[1,0]} == "$playerOne" && ${gameBoard[2,0]} == "+" ]]; then
			gameBoard[2,0]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,1]} == "$playerOne"  && ${gameBoard[1,1]} == "$playerOne" && ${gameBoard[2,1]} == "+" ]]; then
			gameBoard[2,1]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,2]} == "$playerOne"  && ${gameBoard[1,2]} == "$playerOne" && ${gameBoard[2,2]} == "+" ]]; then
			gameBoard[2,2]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,0]} == "$playerOne"  && ${gameBoard[1,1]} == "$playerOne" && ${gameBoard[2,2]} == "+" ]]; then
			gameBoard[2,2]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,2]} == "$playerOne"  && ${gameBoard[1,1]} == "$playerOne" && ${gameBoard[2,0]} == "+" ]]; then
			gameBoard[2,0]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,0]} == "+"  && ${gameBoard[0,1]} == "$playerOne" && ${gameBoard[0,2]} == "$playerOne" ]]; then
			gameBoard[0,0]=$playerTwoCPU
			return
		elif [[ ${gameBoard[1,0]} == "+"  && ${gameBoard[1,1]} == "$playerOne" && ${gameBoard[1,2]} == "$playerOne" ]]; then
			gameBoard[1,0]=$playerTwoCPU
			return
		elif [[ ${gameBoard[2,0]} == "+"  && ${gameBoard[2,1]} == "$playerOne" && ${gameBoard[2,2]} == "$playerOne" ]]; then
			gameBoard[2,0]=$playerTwoCPU
			return

		elif [[ ${gameBoard[0,0]} == "+"  && ${gameBoard[1,0]} == "$playerOne" && ${gameBoard[2,0]} == "$playerOne" ]]; then
			gameBoard[0,0]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,1]} == "+"  && ${gameBoard[1,1]} == "$playerOne" && ${gameBoard[2,1]} == "$playerOne" ]]; then
			gameBoard[0,1]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,2]} == "+"  && ${gameBoard[1,2]} == "$playerOne" && ${gameBoard[2,2]} == "$playerOne" ]]; then
			gameBoard[0,2]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,0]} == "+"  && ${gameBoard[1,1]} == "$playerOne" && ${gameBoard[2,2]} == "$playerOne" ]]; then
			gameBoard[0,0]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,2]} == "+"  && ${gameBoard[1,1]} == "$playerOne" && ${gameBoard[2,0]} == "$playerOne" ]]; then
			gameBoard[0,2]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,0]} == "$playerOne"  && ${gameBoard[0,1]} == "+" && ${gameBoard[0,2]} == "$playerOne" ]]; then
			gameBoard[0,1]=$playerTwoCPU
			return
		elif [[ ${gameBoard[1,0]} == "$playerOne"  && ${gameBoard[1,1]} == "+" && ${gameBoard[1,2]} == "$playerOne" ]]; then
			gameBoard[1,1]=$playerTwoCPU
			return
		elif [[ ${gameBoard[2,0]} == "$playerOne"  && ${gameBoard[2,1]} == "+" && ${gameBoard[2,2]} == "$playerOne" ]]; then
			gameBoard[2,1]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,0]} == "$playerOne"  && ${gameBoard[1,0]} == "+" && ${gameBoard[2,0]} == "$playerOne" ]]; then
			gameBoard[1,0]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,1]} == "$playerOne"  && ${gameBoard[1,1]} == "+" && ${gameBoard[2,1]} == "$playerOne" ]]; then
			gameBoard[1,1]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,2]} == "$playerOne"  && ${gameBoard[1,2]} == "+" && ${gameBoard[2,2]} == "$playerOne" ]]; then
			gameBoard[1,2]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,0]} == "$playerOne"  && ${gameBoard[1,1]} == "+" && ${gameBoard[2,2]} == "$playerOne" ]]; then
			gameBoard[1,1]=$playerTwoCPU
			return
		elif [[ ${gameBoard[0,2]} == "$playerOne"  && ${gameBoard[1,1]} == "+" && ${gameBoard[2,0]} == "$playerOne" ]]; then
			gameBoard[1,1]=$playerTwoCPU
			return
		#Corners
         elif [[ ${gameBoard[0,0]} == "+" ]]; then
         		gameBoard[0,0]=$playerTwoCPU
				return
         elif [[ ${gameBoard[0,2]} == "+" ]]; then
               gameBoard[0,2]=$playerTwoCPU
				return
         elif [[ ${gameBoard[2,0]} == "+" ]]; then
         		gameBoard[2,0]=$playerTwoCPU
				return
         elif [[ ${gameBoard[2,2]} == "+" ]]; then
         		gameBoard[2,2]=$playerTwoCPU
				return
      # Center
         elif [[ ${gameBoard[1,1]} == "+" ]]; then
				gameBoard[1,1]=$playerTwoCPU
				return
      # Sides
         elif [[ ${gameBoard[0,1]} == "+" ]]; then
               	gameBoard[0,1]=$playerTwoCPU
				return
         elif [[ ${gameBoard[1,0]} == "+" ]]; then
            	gameBoard[1,0]=$playerTwoCPU
				return
         elif [[ ${gameBoard[1,2]} == "+" ]]; then
				gameBoard[1,2]=$playerTwoCPU
				return
         elif [[ ${gameBoard[2,1]} == "+" ]]; then
				gameBoard[2,1]=$playerTwoCPU
				return
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
      	echo "Exiting..."
	exit
   fi
}
initializeBoard
displayBoard
wantToPlay
