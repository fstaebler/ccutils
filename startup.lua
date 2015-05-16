--get the latest rshell version
print("get latest stable rshell...")
h = http.get("https://raw.githubusercontent.com/fstaebler/ccutils/master/rshell.lua")

--compile it
print("compile rshell...")
s = loadstring(h.readAll())

--break things
print("give command to rshell...")
s()