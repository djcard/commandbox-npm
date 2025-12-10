/**
 * 
 * Creates a symlink from the global node_modules folder to this folder. 
 * For creating a link to a project use npm linkTo <projectname>.
 * To see what packages are linked to this project use npm projectLinked.
 * 
 * 
 * 
 * 
 * 
 * */

component {
    function run(){
        command("!npm link").run();
    }
}