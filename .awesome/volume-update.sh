volume=`amixer -c $cardid -- sget $channel | pcregrep 'Left:.+[0-9]+%' | pcregrep -o '[0-9]+%' | pcregrep -o '[0-9]+'`

echo "0 widget_tell $widget `handle \"$volume\"`" | awesome-client
