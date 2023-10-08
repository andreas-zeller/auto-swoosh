#!/bin/bash
# Play Mail Sent "Swoosh" sound even if do not disturb is on

# uncomment to get a log
# set -x

# The sound to be played - 'Mail Sent' (swoosh)
mail_sent_sound='/System/Applications/Mail.app/Contents/Resources/Mail Sent.aiff'

sending=false

exec log stream --predicate '(subsystem == "com.apple.mail" and (composedMessage contains "About to play sound Mail Sent" or composedMessage contains "Do Not Disturb is enabled, sound play aborted"))' | \
(
    while true; do
        read LINE
        case $LINE in
        *Filtering\ the\ log\ data*)
            ;;
        *About\ to\ play*)
            sending=true
            ;;
        *sound\ play\ aborted*)
            if $sending; then
                afplay "$mail_sent_sound"
            fi
            sending=false
            ;;
        esac
    done
) &