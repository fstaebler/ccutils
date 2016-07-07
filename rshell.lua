print("rshell starting up...")
print("initiating remote control loop...")
result = "BEGIN"
repeat
  print("Getting a command...")
	a = http.post("http://kek:8000/result", result)
	if a then
		c = a.readAll()
		print("Received Command:")
		print(c)
		print("Executing...")
		s = loadstring(c)
    status, result = pcall(s)
		if not status then
      result = "ERROR\n" .. result
			print("An error occured!")
		else
      result = "SUCCESS\n" .. result
    end
	end
until not a
print("Remote control unavailable!")
print("Exiting to CraftOS.")
