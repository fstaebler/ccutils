print("rshell v0.0.2 starting up...")
print("initiating remote control loop...")
result = "BEGIN"
repeat
  print("Getting a command...")
	a = http.post("http://kek:8000/result", result)
	if a then
		s = loadstring(a.readAll())
    status, result = pcall(s)
		if not status then
      result = "ERROR\n" .. tostring(result)
		else
      result = "SUCCESS\n" .. tostring(result)
    end
	end
until not a
print("Exiting to CraftOS.")
