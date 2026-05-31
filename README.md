# i3-current-media
Show what is playing on your i3 status bar. 
This script uses `playerctl` and `jq`

# Screenshot
<img width="1913" height="110" alt="Sun May 31 03:16:14 PM CEST 2026" src="https://github.com/user-attachments/assets/c77a3a83-2f99-4b8c-a68f-eaee81a2e288" />

# Usage
Download `i3status_media.sh` and add it to your i3 config like so:
```
bar {
        status_command i3status | /path/to/i3status_media.sh
}
```
and make sure you added the line `output_format = "i3bar"` in your status bar config.
