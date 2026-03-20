/**
 * 
 * Runs the audit command with the optional flag 'fix'
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