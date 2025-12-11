/**
 * 
 * Returns a table of the packages to which this project is linked. 
 * 
 * 
 * 
 * 
 * */

component {

    function run(){
        var alreadyLinked=command("!npm ls --link").run(returnOutput=true);
        var newList = alreadyLinked.listToArray(chr(10)).map((item,idx)=>{
            var retme=[]
            if(idx==1){
                var splitter = item.listFirst(" ");
                print.line(splitter.listlen("@"));
                retme=["this Folder->",
                splitter.left(1)=="@" ? "@" & splitter.listFirst("@") :  splitter.listFirst("@"),
                splitter.listLast("@"),
                expandpath(item.listLast(" "))
                ]

            } else {
                var splitter = item.listgetat(2," ");
                retme=[
                    item.listGetAt(1," "),
                    splitter.left(1)=="@" ? "@" & splitter.listFirst("@") :  splitter.listFirst("@"),
                    splitter.listLast("@"),
                    expandpath(getcwd() & "/" & item.listLast(" "))
                ]
            }
            return retme;
        });
        //print.line(newlist);
        //print.line(alreadyLinked.listToArray(chr(10)));
        print.table(headerNames=["Permissions","Package","Version","Location"],data=newlist);
        
    }
}