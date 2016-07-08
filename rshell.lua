api_endpoint = "http://kek:8000/result"

function responsestring(st, msg)
  local id = tostring(os.getComputerID())
  local label = os.getComputerLabel()
  local r = "\n"
  if not label then
    label = "Unnamed Device"
  end
  if not msg then
    msg = ""
  else
    msg = tostring(msg)
  end
  return st .. r .. id .. r .. label .. r .. msg
end

print("rshell v0.0.7 starting up...")
result = responsestring("BEGIN")
repeat
  print("Getting a command...")
  a = http.post(api_endpoint, result)
  if a then
    s = loadstring(a.readAll())
    status, result = pcall(s)
    if not status then
      result = responsestring("ERROR", result)
    else
      result = responsestring("SUCCESS", result)
    end
  end
until not a
print("Exiting to CraftOS.")
