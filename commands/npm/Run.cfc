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
    function run(required string scriptName){
        //var currentFolder = getcwd();
        command("!npm run #scriptName#").run();
    }
}