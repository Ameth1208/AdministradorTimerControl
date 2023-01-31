'use strict';

const cp = require('child_process');

class PcControls {

    constructor() {
        this.debug = false;

        this._commands = {
            lock: {
                win32: 'rundll32.exe user32.dll,LockWorkStation',
            },
            unlock: {
                win32 : 'rundll32.exe user32.dll,UnlockWindowStation',
                //win32: 'unlocker_keyboard.exe',
            },
            begin: {
                win32: 'cd',
            },
            shutdown : {
                win32 : 'shutdown -s -t -f 0'
            },
        };
    }

    _getOs() {
        return process.platform
    };

    run(command, callback) {
        if (this.debug) {
            console.log(`[pc-controls] Command executed: ${command}`);
            callback(true, false, false);
        } else {
            const os = this._getOs();
            console.log(command);
            console.log(os);

            try {
                const cmd = this._commands[command][os];
                console.log(cmd);
                cp.exec(cmd, (err, stdout, stderr) => callback(err, stdout, stderr));
            } catch (e) {
                callback(new Error('Unknown command or OS'));
            }
        }
    };
}

module.exports = new PcControls();
