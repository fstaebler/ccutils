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
programList[1] = "utils/fillToLevel"
for i, p in ipairs(programList) do
	print("installing ", p, "...")
end
print("...done.")