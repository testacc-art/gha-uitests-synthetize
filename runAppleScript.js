import applescript from 'applescript';
 
// Very basic AppleScript command. Returns the song name of each
// currently selected track in iTunes as an 'Array' of 'String's.
import util from 'util'
const exec = util.promisify(applescript.execString);
let script = `
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
`;
 
exec(script).then(result => {
 console.log(`result is result`);
}).catch(err => {
console.log(err);
});
