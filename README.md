# auto-swoosh

On macOS, have a "Swoosh" sound for sending mail even when Do Not Disturb is on.

## Rationale

On macOS, the "Swoosh" sound when sending mail is turned off whenever some focus is activated.
This also applies to "work" focuses and when sending mail, which I think is nonsensical.
The enclosed app (an Automator script) fixes this and plays "Swoosh" sounds for _all_ sent mails, even when some focus is turned on.

## Installation

* Download "Auto Swoosh.app.zip" and unzip it
* Move it to /Applications or ~/Applications and keep it running
* You should now get a "Swoosh sound" whenever 

## How does it work?

Essentially, this is a few lines of shell script that continuously monitor the system log for a message

  Do Not Disturb is enabled, sound play aborted

and if this message occurs, plays a swoosh sound.

Open the application with Automator to see details.
