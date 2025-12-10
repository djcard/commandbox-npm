/**
 * Outputs a list of globally packages which are available to be linked to from the current folder.
 * 
 * 
 * 
 * */

component {

    function run(){
        //var currentFolder = getcwd();
        command("!npm ls -g --link=true").run();
    }
}