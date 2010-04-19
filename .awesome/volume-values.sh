handle() {
    #Hard Mute:
    if [ "$1" == "0" ]
    then
        `amixer -c $cardid sset $channel mute > /dev/null`
    else
        `amixew -c $cardid sset $channel unmute > /dev/null`
    fi

    # Set widget text:
    echo " Volume: $1% "

}

cardid = 0
channel = "Master"
adjust = 5
widget = "volume_control"
speed = 10
