--get the latest rshell version
print("get latest stable rshell...")
h = http.get("http://kek:8000/static/rshell.lua")

--compile it
print("compile rshell...")
s = loadstring(h.readAll())

--break things
print("give command to rshell...")
s()

--pastebin: L9HAJHtv
