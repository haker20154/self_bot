--[[
#      ____       _  __       ____        _     __     _______
#     / ___|  ___| |/ _|     | __ )  ___ | |_   \ \   / /___ /
#     \___ \ / _ \ | |_ _____|  _ \ / _ \| __|___\ \ / /  |_ \
#      ___) |  __/ |  _|_____| |_) | (_) | ||_____\ V /  ___) |
#     |____/ \___|_|_|       |____/ \___/ \__|     \_/  |____/
#
#       Plugin : ASdd-PL
#       Using For Adding Plugin Than Telegram
#       Writend By > BoyCode
#
#     ____               ____          _
#    | __ )  ___  _   _ / ___|___   __| | ___
#    |  _ \ / _ \| | | | |   / _ \ / _` |/ _ \
#    | |_) | (_) | |_| | |__| (_) | (_| |  __/
#    |____/ \___/ \__, |\____\___/ \__,_|\___|
#                 |___/
]]
local function run(msg, matches)
  local text = matches[1]
  local b = 1
  while b ~= 0 do
    text = text:trim()
    text,b = text:gsub('^!+','')
  end
  local name = matches[2]
  local file = io.open("./plugins/"..name..matches[3], "w")
  file:write(text)
  file:flush()
  file:close()
  return "done" end return {
  description = "a Usefull plugin for sudo !",
  usage = "A plugins to add Another plugins to the server",
  patterns = {
    "^[!/#]addplugin +(.+) (.*) (.*)$"
  },
  run = run
}
