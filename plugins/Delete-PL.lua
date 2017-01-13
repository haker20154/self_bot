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
