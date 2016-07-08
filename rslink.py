import http.server
import sqlite3 as sql
import mimetypes as mimetypes
import urllib.parse as urlparse
import json as json
from datetime import datetime

c = sql.connect("rshell.db")

def serve_file(path, s):
  try:
    f = open(path, "rb")
    s.send_response(200)

    #content type
    ctype = mimetypes.guess_type(path)[0]
    if None != ctype:
      s.send_header("Content-type", ctype)
    else:
      s.send_header("Content-type", "application/octet-stream") #this will most likely not render and that's good.
    s.end_headers()
    #send file contents
    while True:
      by = f.read1(1024)
      if len(by) == 0:
        break;
      else:
        s.wfile.write(by)
    f.close()
  except IOError:
    s.send_error(404)

def handle_command(s):
  s.send_error(200)

def handle_result(s):
  l = int(s.headers.get("content-length"))
  print(str(s.rfile.read(l), "utf-8"))
  s.send_response(200)
  s.end_headers()
  s.wfile.write(bytes("os.sleep(1)\nreturn \"Still there & running!\"", "utf-8"))


class rslink_handler(http.server.BaseHTTPRequestHandler):

  server_version = "rslink"

  def do_GET(s):
    path = s.path.split("/")[1:]
    try:
      if path[0] == "static":
        serve_file("static/" + path[1], s)
      elif path[0] == "" or path[0] == "index.html":
        serve_file("index.html", s)
      else:
        s.send_error(403, "Not Allowed", "You are not allowed to access this directory")
    except:
      s.send_error(500, "Server Error", "Something the server was not prepared for happened")

  def do_POST(s):
    path = s.path.split("/")[1:]
    try:
      if path[0] == "result": #minecraft access
        handle_result(s)
      elif path[0] == "command": #web client access
        handle_command(s)
      else:
        s.send_error(501, "Method Not Supported", "POST is not supported for this path.")
    except:
      s.send_error(500, "Server Error", "Something the server was not prepared for happened")

server = http.server.HTTPServer(("", 8000), rslink_handler)
server.serve_forever()
