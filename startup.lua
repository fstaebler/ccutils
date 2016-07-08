--get the latest rshell version
print("get latest stable rshell...")
h = http.get("http://kek:8000/static/rshell.lua")

--compile it
if h then
  print("compile rshell...")
  s = loadstring(h.readAll())
--break things
  print("give command to rshell...")
  s()
else
  print("could not load rshell!")
end
--pastebin: 5QSFCJpA
