# auto-swoosh

On macOS, produce a "Swoosh" sound for sending mail even when Do Not Disturb is on.

## Rationale

On macOS Mail.app, the "Swoosh" sound when sending mail is turned off whenever some focus is activated.
This also applies to "work" focuses and when sending mail, which I think is nonsensical.
The enclosed app (an Automator script) fixes this by playing a "Swoosh" sound whenever Mail.app should, but does not.

## Installation

1. Download `Auto Swoosh.app.zip` and unzip it
2. Move the resulting `Auto Swoosh` app to `/Applications` or `~/Applications` and open it. (You may have to [enable this explicitly](https://www.macworld.com/article/672947/how-to-open-a-mac-app-from-an-unidentified-developer.html).)
3. You should now get a swoosh sound whenever Mail.app sends a mail.
4. The swoosh sound persists as long as `Auto Swoosh` is running.
5. You can also add `Auto Swoosh` to the list of apps that are automatically opened when you login.


## How does it work?

`Auto Swoosh` is a handful of shell script lines that continuously monitor the system log for a log message from Mail.app

    Do Not Disturb is enabled, sound play aborted

and if this message occurs, plays a swoosh sound (instead of Mail.app).

Open `Auto Swoosh.app` with Automator to see details.
