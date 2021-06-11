--  # Setup to do a screen recording.

tell application "QuickTime Player" to new screen recording

--  # Start the screen recording.

tell application "System Events" to tell process "Screen Shot"
    repeat until exists button "Record" of its front window
        delay 0.1
    end repeat
    click button "Record" of its front window
end tell

--  # Set the time in seconds you want the recording to be.

delay 2

--  # Stop the recording.

tell application "System Events" to ¬
    click menu bar item 1 ¬
        of menu bar 1 ¬
        of application process "screencaptureui"
