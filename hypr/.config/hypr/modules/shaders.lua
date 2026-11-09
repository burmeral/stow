-- ~/.config/hypr/modules/shaders.lua

-- Shader dir
local home = os.getenv("HOME")
local dir  = home .. "/.config/hypr/shaders"

local M = {}
local list = {} 
local idx  = 1    -- which shader to use when turning on

local function scan()
  list = {}
  local p = io.popen('ls -1 "' .. dir .. '" 2>/dev/null')
  if not p then return end
  for file in p:lines() do
    local name = file:match("^(.+)%.glsl$") or file:match("^(.+)%.frag$")
    if name then list[#list + 1] = { name = name, path = dir .. "/" .. file } end
  end
  p:close()
  table.sort(list, function(a, b) return a.name < b.name end)
end

local function active_path()
  local cur = hl.get_config("decoration.screen_shader")
  if cur and cur ~= "" then return cur end
end

local function apply(path)
  hl.config({ decoration = { screen_shader = path or "" } })
end

local function notify(msg)
  os.execute('notify-send -t 1500 "shader is on" "' .. msg .. '" &')
end

-- point idx at whatever is currently active 
local function sync()
  local cur = active_path()
  if not cur then return end
  for i, s in ipairs(list) do
    if s.path == cur then idx = i return end
  end
end

function M.on()
  scan()
  if #list == 0 then return notify("no shaders found") end
  if idx > #list then idx = 1 end
  apply(list[idx].path)
  notify(list[idx].name)
end

function M.off()
  sync()
  apply(nil)
  notify("off")
end

function M.toggle()
  if active_path() then M.off() else M.on() end
end

function M.cycle(step)
  scan()
  if #list == 0 then return notify("no shaders found") end
  sync()
  idx = (idx - 1 + step) % #list + 1
  apply(list[idx].path)
  notify(list[idx].name)
end

function M.set(name)
  scan()
  for i, s in ipairs(list) do
    if s.name == name then
      idx = i
      apply(s.path)
      return notify(s.name)
    end
  end
  notify("unknown shader: " .. name)
end

-- Binds
hl.bind("SUPER + apostrophe",      M.toggle)
hl.bind("SUPER + bracketleft",     function() M.cycle(1)  end)
hl.bind("SUPER + bracketright",    function() M.cycle(-1) end)

return M
