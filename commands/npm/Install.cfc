/**
 * 
 * Installs a package or a project's dependencies using npm.
 * 
 * 
 * 
 * 
 * */


component {
    function run( string project=""){
        command("!npm install #project#").run();
    }
}