component {
    /***
     * 
     * @type.options major,minor,patch,premajor,preminor,prepatch,prerelease,from-git
     * 
     * 
     * 
    */
    function run(required string type, string message=""){
        var msg = message.len() ? "-m #message#" : "";


        command("!npm version #type# #msg#").run();
    }
}