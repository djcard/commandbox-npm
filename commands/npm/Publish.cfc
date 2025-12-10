/**
 * 
 * Publishes the current package to the npm registry. Does not alter semver in package.json.
 * 
 * 
 * */

component {
    function run(){
        command("!npm publish").run();
    }
}