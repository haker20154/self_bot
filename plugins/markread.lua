local function solid(msg, matches)
if matches[1]:lower() == "markread" then
     if matches[2] == "on" then
      redis:set("bot:markread", "on")
      return "Mark read is on now"
     elseif matches[2] == "off" then
      redis:del("bot:markread")
      return "Mark read is off now"
     elseif matches[2] == "status" then
     if redis:get("bot:markread") == "on" then
      return "Mark read > on"
     else
      return "Mark read > off"
         end
      end
   end
end
return {               
patterns = {
   "^[!/]([Mm]arkread) (.*)$",
 }, 
run = solid,
}