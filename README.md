# auto-swoosh

On macOS, produce a "Swoosh" sound for sending mail even when Do Not Disturb is on.

## Rationale

On macOS Mail.app, the "Swoosh" sound when sending mail is turned off whenever some focus is activated.
This also applies to "work" focuses and when sending mail, which I think is nonsensical.
The enclosed app (an Automator script) fixes this by playing a "Swoosh" sound whenever Mail.app should, but does not.

## Installation

1. Download "Auto Swoosh.app.zip" and unzip it
2. Move it to /Applications or ~/Applications and open it. (You may have to explicitly enable this.)
3. You should now get a "Swoosh sound" whenever Mail.app sends a mail.

## How does it work?

Essentially, this is a few lines of shell script that continuously monitor the system log for a message

    Do Not Disturb is enabled, sound play aborted

and if this message occurs, plays a swoosh sound.

Open the application with Automator to see details.
