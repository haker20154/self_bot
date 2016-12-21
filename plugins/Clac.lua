--[[
#      ____       _  __       ____        _     __     _______
#     / ___|  ___| |/ _|     | __ )  ___ | |_   \ \   / /___ /
#     \___ \ / _ \ | |_ _____|  _ \ / _ \| __|___\ \ / /  |_ \
#      ___) |  __/ |  _|_____| |_) | (_) | ||_____\ V /  ___) |
#     |____/ \___|_|_|       |____/ \___/ \__|     \_/  |____/
#
#       Plugin : Calculater
#       Using For Math on Telegram
#       Writend By > BoyCode
#
#     ____               ____          _
#    | __ )  ___  _   _ / ___|___   __| | ___
#    |  _ \ / _ \| | | | |   / _ \ / _` |/ _ \
#    | |_) | (_) | |_| | |__| (_) | (_| |  __/
#    |____/ \___/ \__, |\____\___/ \__,_|\___|
#                 |___/
]]
local function mathjs(exp)
  local url = 'http://api.mathjs.org/v1/'
  url = url..'?expr='..URL.escape(exp)
  local b,c = http.request(url)
  local text = nil
  if c == 200 then
    text = '= '..b
  
  elseif c == 400 then
    text = b
  else
    text = 'Unexpected error\n'
      ..'Is api.mathjs.org up?'
  end
  return text
end

local function run(msg, matches)
  return mathjs(matches[1])
end

return {
  description = "Calculate math expressions with mathjs API",
  usage = "!calc [expression]: evaluates the expression and sends the result.",
  patterns = {
    "^!calc (.*)$",
	"^[Cc]alc (.*)$"

  },
  run = run
}
