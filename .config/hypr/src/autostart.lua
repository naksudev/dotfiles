-- Autostart
-- https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on('hyprland.start', function()
  hl.exec_cmd('/usr/lib/polkit-kde-authentication-agent-1')
  hl.exec_cmd('hypridle')
  hl.exec_cmd('udiskie &')
  hl.exec_cmd('/home/naksu/.config/waybar/launch.sh')
  hl.exec_cmd(
    'awww-daemon && awww img --transition-duration 1 --transition-step 5 -t right ~/Pictures/Wallpapers/dark_wallhaven-28qdjx.png'
  )
  hl.exec_cmd('swaync -s ~/.config/swaync/style.css -c ~/.config/swaync/config.json')
  hl.exec_cmd('swayosd-server')
  hl.exec_cmd('kitty', { workspace = 'special:magic silent' })
end)

hl.on('hyprland.shutdown', function()
  hl.exec_cmd('awww kill')
end)
