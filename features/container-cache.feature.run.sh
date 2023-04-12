. $HOTBOX/lib/sh.sh


child="/hotbox-cache"
if $HOTBOX/hotbox-in-container ; then
    me="$child"
    host="$($HOTBOX/hotbox-host-path $me)"
    if [ -z "$host" ] ; then
        warn "$child will be unavailable because it has not been bind mounted from the host"
        exit 0
    fi
else
    me="$HOME/.hotbox/cache"
    host="$me"
    if ! [ -d "$me" ] ; then
        heading "Creating $me to back $child in containers"
        echo_on
        mkdir -p $me
        echo_off
    fi
fi


echo --volume $host:$child