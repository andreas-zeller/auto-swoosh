# auto-swoosh

On macOS, produce a "Swoosh" sound when sending mail even when Do Not Disturb or some other focus is on.

## Rationale

On macOS Mail.app, the "Swoosh" sound when sending mail is turned off whenever some focus such as "do not disturb" is activated.
I think this is a bug, as I am rarely "disturbed" by my own actions.
The enclosed app (an Automator script) fixes this by playing a "Swoosh" sound whenever Mail.app should, but does not.

## Installation

1. Download `Auto Swoosh.app.zip` and unzip it
2. Move the resulting `Auto Swoosh` app to `/Applications` or `~/Applications` and open it. (You may have to [enable this explicitly](https://www.macworld.com/article/672947/how-to-open-a-mac-app-from-an-unidentified-developer.html).)
3. Note that `Auto Swoosh` shows no notification that it is running - no menu bar icon, no dock, nada, niente, rien.
4. However, you should **now get a swoosh sound whenever Mail.app sends a mail** - even when "do not disturb" or any other focus mode is on.
5. The swoosh sound persists as long as `Auto Swoosh` is running.
6. You can also add `Auto Swoosh` to the list of apps that are automatically opened when you login.


## How does it work?

`Auto Swoosh` is a handful of shell script lines that continuously monitor the system log for a log message from Mail.app

    Do Not Disturb is enabled, sound play aborted

and if this message occurs, plays a swoosh sound (instead of Mail.app).

Open `Auto Swoosh.app` with Automator to see details.
