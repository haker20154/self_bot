do
  
local function run(msg,matches)
if not is_sudo(msg) then
    return "Only For Sudo!"
end
if matches[1] == "download" and matches[2] then
local url = matches[2]
local file = download_to_file(url,randomd)
local cb_extra = {file_path=file}
send_file(get_receiver(msg), file, rmtmp_cb, cb_extra)
return "Please Wait!"
else
return "Error!"
end
end
return {
  patterns = {
"^[!#/](download) (.*)$",
},
run = run,
}
end
