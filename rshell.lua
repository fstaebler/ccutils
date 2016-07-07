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
print("initiating remote control loop...")
result = "BEGIN"
repeat
	a = http.post("http://kek:8000/result", result)
	if a then
		c = a.readAll()
		print("Received Command:")
		print(c)
		print("Executing...")
		s = loadstring(c)
		if not pcall(s) then
			print("An error occured!")
		end
	end
until not a
print("remote control unavailable!")
print("Exiting to CraftOS.")
