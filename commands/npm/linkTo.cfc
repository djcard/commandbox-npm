

/**
 * 
 * Creates a symlink from this project to the global node_modules folder for the submitted package.
 * For creating a link to a project use npm linkTo <projectname>
 * 
 * 
 * 
 * 
 * */
component {

    function run( required string project ){
        //var currentFolder = getcwd();
        var alreadyLinked=command("!npm ls --link").run(returnOutput=true);
        var newList = alreadyLinked.listToArray(chr(10))
            .filter((item,idx)=> idx > 1 ? true : false )
        .map((item)=>{
            var ar = item.listToArray(" ");
            var parts = ar[1].findNoCase("--") > 0 ? ar[2] : ar[1];
            var retme = parts.listToArray("@");
            return parts.left(1)=="@" ? "@" & retme[1] : retme[1];
            
        });

        if(listLen(project) > 1){
            project = project.replace(","," ","all")
        }
        command("!npm link #project# #newlist.toList(' ')# ").run();
    }
}