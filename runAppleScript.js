const applescript = require('run-applescript');

applescript.runAppleScriptAsync(`
tell application "QuickTime Player"
  --activate
  new screen recording
  start document 1
  delay 5
  xcodebuild clean -scheme "AccessibilityElementAdaptor UI Tests" -configuration "UI Testing" test
  stop document 1
  save document 1 in file "/tmp/test.mov"
  quit
end tell
`).then(result => {
  console.log(`result is ${result}`);
}).catch(console.log);