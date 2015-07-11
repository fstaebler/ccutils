print("rshell starting up...")
--...
if fs.exists("utils") then
	print("removing old utils...")
	fs.delete("utils")
	print("...done.")
end
print("installing utils...")
fs.makeDir("utils")
programList = {}
--t[1] = "utils/fillToLevel"
for p in programList do
	print("installing " + p + "...")
end
print("...done.")