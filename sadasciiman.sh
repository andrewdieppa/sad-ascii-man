#!/bin/bash

oldIFS=$IFS
IFS=""

wordBank=("potato"
"title"
"base"
"class"
"ladybug"
"wash"
"hour"
"north"
"trail"
"health"
"prose"
"invention"
"beds"
"umbrella"
"laugh"
"space"
"interest"
"vein"
"card"
"pan"
"competition"
"cub"
"support"
"clam"
"wealth"
"cart"
"slave"
"thumb"
"detail"
"ring"
"scene"
"railway"
"wine"
"direction"
"hall"
"hook"
"cake"
"volcano"
"dinosaurs"
"juice"
"squirrel"
"fowl"
"geese"
"feeling"
"kitty"
"humor"
"cap"
"quiet"
"hill"
"vest"
"chess"
"word"
"suit"
"memory"
"ghost"
"writer"
"plants"
"wish"
"business"
"snow"
"control"
"sneeze"
"cars"
"trucks"
"knife"
"icicle"
"brake"
"agreement"
"circle"
"skirt"
"tomatoes"
"lace"
"rhythm"
"rat"
"island"
"bone"
"wheel"
"army"
"honey"
"education"
"dolls"
"hope"
"vacation"
"crime"
"action"
"snails"
"floor"
"root"
"square"
"adjustment"
"zephyr"
"harbor"
"uncle"
"sun"
"grain"
"sail"
"government"
"bag"
"lake"
"look")

isValidInput=1
answer="andrew is cool"
answerArray=()
playArray=()
guess=""
missed=0
discovered=0
won=0
turnFail=1
players=1

if [ "$1" == "-help" ]
then
    echo "Guess the word or phrase! Run the script and follow the directions. Have fun!"
    exit 0
fi

clear

echo "1 player or 2 players? (enter 1 or 2):"
read players

if [[ "$players" != 1 || "$players" != 2 ]]
then
    isValidInput=0
fi

while [ $isValidInput -eq 0 ]
do
    if [ $players -eq 1 ]
    then
        RANDOM=$$
        answer=${wordBank[(($RANDOM%${#wordBank[@]}))]}
        isValidInput=1
    elif [ $players -eq 2 ]
    then
        echo "Player 1 - enter a secret word or phrase:"
        read answer
        isValidInput=1
    else
        clear
        echo "1 player or 2 players? (enter 1 or 2):"
        echo "Invalid choice..."
        read players
    fi
done

answerLen=${#answer}

clear

for (( i=0; i<$answerLen; i++))
do
    answerArray+=(${answer:$i:1})
done

for letter in ${answerArray[@]}
do
    if [ "$letter" == " " ]
    then
        playArray+=(" ")
    else
        playArray+=("_")
    fi
done

while [ $missed -le 6 ]
do
    case $missed in
        1)
            echo "         ___________"
            echo "        /___________\\"
            echo "   ____/_____________\\____"
            echo "       |   __        |"
            echo "      C|  /(O)       |D"
            echo "       |             |"
            echo "       |             |"
            echo "       \\             /"
            echo "        \\___________/"
            echo
            ;;
        2)
            echo "         ___________"
            echo "        /___________\\"
            echo "   ____/_____________\\____"
            echo "       |   __   __   |"
            echo "      C|  /(O) (O)\  |D"
            echo "       |             |"
            echo "       |             |"
            echo "       \\             /"
            echo "        \\___________/"
            echo
            ;;
        3)
            echo "         ___________"
            echo "        /___________\\"
            echo "   ____/_____________\\____"
            echo "       |   __   __   |"
            echo "      C|  /(O) (O)\  |D"
            echo "       |      L      |"
            echo "       |             |"
            echo "       \\             /"
            echo "        \\___________/"
            echo
            ;;
        4)
            echo "         ___________"
            echo "        /___________\\"
            echo "   ____/_____________\\____"
            echo "       |   __   __   |"
            echo "      C|  /(O) (O)\\  |D"
            echo "       |      L      |"
            echo "       |    _____    |"
            echo "       \\   /     \\   /"
            echo "        \\___________/"
            echo
            ;;
        5)
            echo "         ___________"
            echo "        /___________\\"
            echo "   ____/_____________\\____"
            echo "       |   __   __   |"
            echo "      C|  /(O) (O)\\  |D"
            echo "       |      L  '   |"
            echo "       |    _____    |"
            echo "       \\   /     \\   /"
            echo "        \\___________/"
            echo
            ;;
        6)
            echo "         ___________"
            echo "        /___________\\"
            echo "   ____/_____________\\____"
            echo "       |   __   __   |"
            echo "      C|  /(O) (O)\\  |D"
            echo "       |      L  '   |"
            echo "       |    _____'   |"
            echo "       \\   /     \\   /"
            echo "        \\___________/"
            echo
            ;;
        *)
            echo "         ___________"
            echo "        /___________\\"
            echo "   ____/_____________\\____"
            echo "       |             |"
            echo "      C|             |D"
            echo "       |             |"
            echo "       |             |"
            echo "       \\             /"
            echo "        \\___________/"
            echo
            ;;
    esac

    if [ $missed -eq 6 ]
    then
        echo "You lose..."
        break
    fi

    echo ${playArray[@]}
    echo

    if [ $discovered -eq $answerLen ]
    then
        won=1
        break
    fi

    echo "Pick a letter: "
    read guess

    for i in ${!answerArray[@]}
    do
        if [ "${answerArray[$i]}" == "$guess" ]
        then
            playArray[i]=$guess
            turnFail=0
        fi
    done

    if [ $turnFail -eq 1 ]
    then
        missed=$((missed+1))
    else
        turnFail=1
    fi

    discovered=0
    for i in ${!playArray[@]}
    do
        if [ "${playArray[$i]}" == "${answerArray[$i]}" ]
        then
            discovered=$((discovered+1))
        fi
    done

    clear
done

if [ $won -eq 1 ] 
then
    echo "You win!"
fi
