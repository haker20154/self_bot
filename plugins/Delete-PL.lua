--[[
#      ____       _  __       ____        _     __     _______
#     / ___|  ___| |/ _|     | __ )  ___ | |_   \ \   / /___ /
#     \___ \ / _ \ | |_ _____|  _ \ / _ \| __|___\ \ / /  |_ \
#      ___) |  __/ |  _|_____| |_) | (_) | ||_____\ V /  ___) |
#     |____/ \___|_|_|       |____/ \___/ \__|     \_/  |____/
#
#       Plugin : Delete-PL
#       Using For Deleting Plugin Than Telegram
#       Writend By > BoyCode
#
#     ____               ____          _
#    | __ )  ___  _   _ / ___|___   __| | ___
#    |  _ \ / _ \| | | | |   / _ \ / _` |/ _ \
#    | |_) | (_) | |_| | |__| (_) | (_| |  __/
#    |____/ \___/ \__, |\____\___/ \__,_|\___|
#                 |___/
]]
function run(msg, matches)
if is_sudo(msg) then
rm = io.popen('rm -f plugins/'..matches[1]..'.lua')
res = rm:read('*all')
if not res then return 'Done' end
return '<b>Deleted</b> !'
end
end
return {
patterns = {
"^[!/#][Dd]elplug (.*)$",
"^[Dd]elplug (.*)$",
},
run = run
}
