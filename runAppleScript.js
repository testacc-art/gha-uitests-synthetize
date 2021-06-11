import applescript from 'applescript';
 
// Very basic AppleScript command. Returns the song name of each
// currently selected track in iTunes as an 'Array' of 'String's.
import util from 'util'
const exec = util.promisify(applescript.execFile);
 
exec('./check.zsh').then(result => {
 console.log(`result is result`);
}).catch(err => {
console.log(err);
});
