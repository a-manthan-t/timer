import std/[cmdline, os, strformat, strutils, terminal]

let params = commandLineParams()

if params.len != 0:
  if params[0] == "stopwatch":
    var secs = 0

    echo "Starting stopwatch now!"
    
    while true:
      stdout.eraseLine()
      stdout.write fmt"{secs div 3600} hrs, {(secs mod 3600) div 60} mins, {secs mod 60} secs"
      stdout.flushFile()
      sleep 1000
      secs += 1

    echo "Goodbye!"
  elif params[0] == "time" and params.len != 1:
    let time = params[1].split(":")
    var secs = parseInt(time[^1]) +
            (if time.len >= 2: parseInt(time[^2]) * 60 else: 0) +
            (if time.len >= 3: parseInt(time[^3]) * 3600 else: 0)

    echo "Time starts now!"

    while secs != 0:
      stdout.eraseLine()
      stdout.write fmt"{secs div 3600} hrs, {(secs mod 3600) div 60} mins, {secs mod 60} secs"
      stdout.flushFile()
      sleep 1000
      secs -= 1

    echo "Time's up!"
  else: echo "Invalid command ('timer stopwatch' or 'timer time [[hours:]mins:]secs')."
else: echo "Invalid command ('timer stopwatch' or 'timer time [[hours:]mins:]secs')."

