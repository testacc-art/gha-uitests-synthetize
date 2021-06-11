import applescript from 'applescript';
 import child_process from 'child_process'
import path from 'path';
// Very basic AppleScript command. Returns the song name of each
// currently selected track in iTunes as an 'Array' of 'String's.
import util from 'util'
const exec = util.promisify(applescript.execFile);
const getPWD = util.promisify(child_process.exec);
getPWD('pwd').then(result => {
    console.log(result.stdout);
    const check = path.join(result.stdout.replace('\n', ''), 'check.zsh')
    console.log(`check ${check} check`);
    exec(check).then(result => {
        console.log(`result is ${result}`);
       }).catch(err => {
       console.log(err);
       });
}).catch(err => {
    console.log(err);
})

