/**
 * 
 * Will remove a symbolic link from globally-installed package-name to node_modules/ of the current folder.
 * 
 * 
 * 
 * 
 * */

component {
    function run(package=""){
        var alreadyLinked=command("!npm ls --link").run(returnOutput=true);
        var newList = alreadyLinked.listToArray(chr(10))
            .filter((item,idx)=> idx > 1 ? true : false )
        .map((item)=>{
            var ar = item.listToArray(" ");
            var parts = ar[1].findNoCase("--") > 0 ? ar[2] : ar[1];
            var retme = parts.listToArray("@");
            return parts.left(1)=="@" ? "@" & retme[1] : retme[1];
        }).filter((item)=>{
            return item != package
        });

        print.line("I'd remove #package#");
        print.line(newList);
        command("!npm link #newlist.toList(' ')# ").run();
    }
}