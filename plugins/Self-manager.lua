--[[
#      ____       _  __       ____        _     __     _______
#     / ___|  ___| |/ _|     | __ )  ___ | |_   \ \   / /___ /
#     \___ \ / _ \ | |_ _____|  _ \ / _ \| __|___\ \ / /  |_ \
#      ___) |  __/ |  _|_____| |_) | (_) | ||_____\ V /  ___) |
#     |____/ \___|_|_|       |____/ \___/ \__|     \_/  |____/
#
#       Plugin : Self-Manager
#       Using For Manageing Your Self-Bot In Telegram
#       Writend By > SoliD
#	Edited By > BoyCode
#     ____               ____          _
#    | __ )  ___  _   _ / ___|___   __| | ___
#    |  _ \ / _ \| | | | |   / _ \ / _` |/ _ \
#    | |_) | (_) | |_| | |__| (_) | (_| |  __/
#    |____/ \___/ \__, |\____\___/ \__,_|\___|
#                 |___/
#        ____        _ _ ____
#	/ ___|  ___ | (_)  _ \
#	\___ \ / _ \| | | | | |
#	 ___) | (_) | | | |_| |
#	|____/ \___/|_|_|____/
]]
-- Checks if bot was disabled on specific chat
local function is_channel_disabled( receiver )
	if not _config.disabled_channels then
		return false
	end

	if _config.disabled_channels[receiver] == nil then
		return false
	end

  return _config.disabled_channels[receiver]
end

local function enable_channel(receiver)
	if not _config.disabled_channels then
		_config.disabled_channels = {}
	end

	if _config.disabled_channels[receiver] == nil then
		return "<b>Self-Bot</b> Status : <b>Not Offline</b>"
	end
	
	_config.disabled_channels[receiver] = false

	save_config()
	return "<b>Self-Bot</b> Has Been <b>Online</b>"
end

local function disable_channel( receiver )
	if not _config.disabled_channels then
		_config.disabled_channels = {}
	end
	
	_config.disabled_channels[receiver] = true

	save_config()
	return "<b>Self-Bot</b> Has Been <b>Offline</b>"
end

local function pre_process(msg)
	local receiver = get_receiver(msg)
	
	-- If sender is moderator then re-enable the channel
	if is_sudo(msg) then
	  if msg.text == "/self on" or msg.text == "/Self on" or msg.text == "!self on" or msg.text == "!Self on" then
	  
	    enable_channel(receiver)
	  end
	end

  if is_channel_disabled(receiver) then
  	msg.text = ""
  end
-----------------------
         local autoleave = 'autoleave'
         local bot_id = our_id 
         local receiver = get_receiver(msg)
           if not redis:get(autoleave) then
    if msg.service and msg.action.type == "chat_add_user" and msg.action.user.id == tonumber(bot_id) and not is_sudo(msg) then
       send_large_msg(receiver, "Please Don't <b>invite me</b>\nIf you want invite Send <b>Link</b> in my <b>PV</b>", ok_cb, false)
       chat_del_user(receiver, 'user#id'..bot_id, ok_cb, false)
	   leave_channel(receiver, ok_cb, false)
    end
end
	return msg
end
-------------------
local function run(msg, matches)
	local receiver = get_receiver(msg)
	-- Enable a channel
	
	local hash = 'usecommands:'..msg.from.id..':'..msg.to.id
    redis:incr(hash)
	if not is_sudo(msg) then
	return nil
	end
	if matches[1] == 'on' then
		return enable_channel(receiver)
	end
	-- Disable a channel
	if matches[1] == 'off' then
		return disable_channel(receiver)
	end
	           ---------------------
if matches[1] == 'help'  then
    if msg.to.type == 'channel' or msg.to.type == 'chat' then
	local text = [[!self on|off
Enable Self-Bot Or No !

!plist
See Plugins List

!pl + (plugin-name)
Enable Custom Plusin !

!pl + (plugin-name) chat
Enable Custom Plusin For custom groups !

!pl - (plugin-name)
Disable Custom Plusin !

!pl - (plugin-name) chat
Disable Custom Plusin For custom groups !

!reload
Refresh All Of Your Plugins !

!pvblock [Reply|Username|ID]
Block With Reply | Username | ID !

!pvunblock [Reply|Username|ID]
UnBlock With Reply | Username | ID !

!autoleave on|off
Enable AutoLeave Or No !

!markread on|off
Enable MarkRead Or No !

!leave [InGroup|InSuperGroup]
For Leave Than Group or Super-Group !

!broadcast [text]
Send BroadCast !

!secretary on|off
Enable Secretary or no !

!setpm [text]
Set Secretary PM !

!calc [ + * % ÷ ......]
Your Calculater !

!setcmd [cmd] [ans]
Set Global Command !

!shortlink [link]
Get Shorten Link !

show [Plugin Name]
Send Plugin With Text Format !

!time [area]
See Time !

$[Your Linux CMD]
Contact to Terminal !

!send [plugin name]
Get Plugin !

!addplugin [plugin name] [your plugin]
Add Plugin !

!delplug [plugin name]
Delete Plugin !

!typing on|off|status
Enable Typing Or No Or See status !

!id
Get Your ID | GP | Super-GP id

!ids chat
Get members ids On Group !

!ids channel
Get members ids On Super-Group !

!tr [lang] [text]
Translate Word ! 
]]
 send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
			return "Help was sent in your private message!"
		end
end 
-----------------------
     if matches[1] == 'autoleave' and is_sudo(msg) then
local hash = 'autoleave'
--Enable Auto Leave
     if matches[2] == 'enable' then
    redis:del(hash)
   return 'Auto leave has been enabled'
--Disable Auto Leave
     elseif matches[2] == 'disable' then
    redis:set(hash, true)
   return 'Auto leave has been disabled'
--Auto Leave Status
      elseif matches[2] == 'status' then
      if not redis:get(hash) then
   return 'Auto leave is enable'
       else
   return 'Auto leave is disable'
         end
      end
   end
end

return {
	description = "Plugin to manage channels. Enable or disable channel.", 
	usage = {
		"/channel enable: enable current channel",
		"/channel disable: disable current channel" },
	patterns = {
		"^[!/#](autoleave) (.*)$",
		"^[!/#](help)$",
		"^[!/][Ss]elf (on)",
		"^[!/][Ss]elf (off)" }, 
	run = run,
	--privileged = true,
	moderated = true,
	pre_process = pre_process
}
