# DEPRECATED
# I use hypridle instead.
swayidle -w timeout 300 'swaylock -f --config ~/.config/swaylock/config --grace 2' \
	    timeout 600 'systemctl suspend' \
	    before-sleep 'swaylock -f --config ~/.config/swaylock/config' &
