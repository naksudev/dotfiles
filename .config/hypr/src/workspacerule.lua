-- Workspace rules
-- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
for i = 1, 6 do
  hl.workspace_rule({ workspace = i .. '', monitor = 'eDP-1', persistent = true })
end
