. ~/.awesome/volume-values.sh

if [ "$1" == "up" ]
then 
    amixer -q -c $cardid sset $channel $adjust%+
fi

if [ "$1" == "down" ]
then
    amixer -q -c $cardid sset $channel $adjust%-
fi

if [ "$1" == "mute" ]
then 
    amixer -q -c $cardid sset $channel 0%
fi

# Force awesome to update:
~/.awesome/volume-update.sh
