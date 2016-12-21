--[[
#      ____       _  __       ____        _     __     _______
#     / ___|  ___| |/ _|     | __ )  ___ | |_   \ \   / /___ /
#     \___ \ / _ \ | |_ _____|  _ \ / _ \| __|___\ \ / /  |_ \
#      ___) |  __/ |  _|_____| |_) | (_) | ||_____\ V /  ___) |
#     |____/ \___|_|_|       |____/ \___/ \__|     \_/  |____/
#
#       Plugin : Send-PL
#       Using For Send|Get Plugin On Telegram
#       Writend By > BoyCode
#
#     ____               ____          _
#    | __ )  ___  _   _ / ___|___   __| | ___
#    |  _ \ / _ \| | | | |   / _ \ / _` |/ _ \
#    | |_) | (_) | |_| | |__| (_) | (_| |  __/
#    |____/ \___/ \__, |\____\___/ \__,_|\___|
#                 |___/
]]
do

local function run(msg, matches)
  if matches[1] == "send" then
    local file = matches[2]
    if is_sudo(msg) then
      local receiver = get_receiver(msg)
      send_document(receiver, "./plugins/"..file..".lua", ok_cb, false)
    end
  end
end

return {
  patterns = {
  "^[!/#](send) (.*)$"
  },
  run = run
}
end
