/**
 * Start Command
 *
 * Shortcut to run 'npm run dev' in a new command window from the current working directory.
 * 
 *{code:bash}
 * npm dev
 * {code}
 */

component {
    function run(){
        //var currentFolder = getcwd();
        command("!start npm run start").run();
    }
}