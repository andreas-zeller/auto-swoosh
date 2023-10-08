#!/bin/bash
# Play Mail Sent "Swoosh" sound even if do not disturb is on

# Use -x as option to get diagnostic messages
if [ "$1" = '-x' ]; then
    set -x
fi

# The sound to be played - 'Mail Sent' (swoosh)
mail_sent_sound='/System/Applications/Mail.app/Contents/Resources/Mail Sent.aiff'

sending=false

exec log stream --predicate '(subsystem == "com.apple.mail" and (composedMessage contains "About to play sound Mail Sent" or composedMessage contains "Do Not Disturb is enabled, sound play aborted"))' | \
(
    while true; do
        read LINE
        LINE="$LINE" # for debugging output
        case "$LINE" in
        *Filtering\ the\ log\ data*)
            ;;
        *About\ to\ play*)
            sending=true
            ;;
        *sound\ play\ aborted*)
            # This message also occurs for incoming mail on DnD, 
            # so we only play a sound if we have seen a "sending" message
            if $sending; then
                afplay "$mail_sent_sound"
            fi
            sending=false
            ;;
        esac
    done
) &