# i3-current-media
Show what is playing on your i3 status bar. 
This script uses `playerctl` and `jq`

# Screenshot
<img width="1920" height="107" alt="Sun May 31 03:17:51 PM CEST 2026" src="https://github.com/user-attachments/assets/d4ca47d3-ec70-4117-9ed7-ed1c1250df8e" />

# Usage
Download `i3status_media.sh` and add it to your i3 config like so:
```
bar {
        status_command i3status | /path/to/i3status_media.sh
}
```
and make sure you added the line `output_format = "i3bar"` in your status bar config.
