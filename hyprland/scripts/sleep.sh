swayidle -w timeout 60 'swaylock -f --config ~/.config/swaylock/config --grace 2' \
	    timeout 180 'systemctl suspend' \
	    before-sleep 'swaylock -f --config ~/.config/swaylock/config' &
