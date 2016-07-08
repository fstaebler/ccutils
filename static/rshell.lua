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

print("rshell v0.1.10")
result = responsestring("BEGIN")
i = 0
while i < 10 do
  repeat
    a = http.post(api_endpoint, result)
    if a then
      i = 0
      s = loadstring(a.readAll())
      status, result = pcall(s)
      if not status then
        result = responsestring("ERROR", result)
      else
        result = responsestring("SUCCESS", result)
      end
    end
  until not a
  os.sleep(10)
  i = i + 1
  print("connection failed, retrying...")
end
print("exiting to craftOS.")
