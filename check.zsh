tell application "QuickTime Player"
  --activate
  new screen recording
  start document 1
  delay 5
  stop document 1
  save document 1 in file "/tmp/test.mov"
  quit
end tell
