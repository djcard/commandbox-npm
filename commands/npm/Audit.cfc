/**
 * 
 * Installs a package or a project's dependencies using npm.
 * 
 * 
 * 
 * 
 * */


component {
    function run( boolean fix=0){
        command("!npm audit #fix ? 'fix' : ''#").run();
    }
}