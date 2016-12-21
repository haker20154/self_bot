--[[
#      ____       _  __       ____        _     __     _______
#     / ___|  ___| |/ _|     | __ )  ___ | |_   \ \   / /___ /
#     \___ \ / _ \ | |_ _____|  _ \ / _ \| __|___\ \ / /  |_ \
#      ___) |  __/ |  _|_____| |_) | (_) | ||_____\ V /  ___) |
#     |____/ \___|_|_|       |____/ \___/ \__|     \_/  |____/
#
#       Plugin : Show-PL
#       Using For Show/Send Plugin with Pm
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
local function view_sura(chat_id, target)
	local f = io.open("./plugins/("..target..").lua","r")
	if f ~= nil then
		local text = f:read("*all")
		return text
	else
		return '<b>Plugin Not Found</b> !'
	end
end

local function run(msg, matches)
    local chat_id = msg.to.id
	if matches [1] == "how" and is_sudo(msg) then
		local file = io.open("./plugins/"..matches [2]..".lua", "r")
		local text = file:read("*all")
		return text
	end
end

return {
	patterns = {
		"^[Ss](how) (.+)$",
    }, 
	run = run,
	}
end
