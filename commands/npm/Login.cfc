/**
 * Logs into npm registry. Doesn't take any arguments, will prompt for username, password and email.
 * 
 * 
 * */

component {
    function run(){
        command("!npm login").run();
    }
}