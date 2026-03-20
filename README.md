# NPM

CommandBox-NPM is a CommandBox tool meant facilitate select commands which are normally run from the npm cli
but are made available here in order to have less windows open and context switching. For the most part the commands mirror what is located at https://docs.npmjs.com/cli/v11/commands with a few exceptions listed below. Not all commands are implemented.

## Workflows

### Background

When creating a JS based project such as in React, Vue or others, it is common to be working on multiple modules or packages at the same time. Code which works together but should exist in different packages and published separately to npm or other package manager in order to follow best practices. However, this can make for some complex folder structures or tedious workflows because your primary project needs to read (hopefully in real time) the other packages but you don't necessarily want the development root of those other projects to be housed in the node_modules folder of your primary project for many reasons including:
    - Not wanting it overwritten if you need to run ```npm install```
    - Not wanting a git root to be nested deep within another project / git repo

### Linking projects

NPM / Node supports the linking of projects which is essentially creating a virtual folder / alias in your main project which points to your other package in its "real" home elesewhere. In your IDE it appears as if that other folder is in your node_modules folder but it is still out of harms way if ```npm install``` is run. In the command line, this is done with the ```npm link``` command but that can also lead to some tricky syntax, especially if you are trying to link to multiple other projects.

### The Flow

1. Create your main project complete with package.json and name. Example: In C:\myroot\mainproject is the package.json with { name:"awesomeProject"}
2. Create ( or navigate to ) your other package you wish to include. The package.json file must exist for this package as well. Example: In C:\otherroot\packagefolder is the package.json with {"name":"iwanttoincludethis"}.
3. In the "sub" package, use the command ```NPM link``` in CommandBox. This will register the package as being available to be linked to. Example: in In C:\otherroot\packagefolder type ```NPM link```
4. In your main project, use the command ```NPM linkto << name of other project >>```. You can use this name alone, even if there are other projects. Example:  In C:\myroot\mainproject type ```NPM linkto iwanttoincludethis```.
5. Back in C:\myroot\mainproject, run ```NPM projectLinked``` to what to what other projects your main on is linked. You should see ```iwanttoincludethis```. You should also see the folder iwanttoincludethis in your main projects node_modules folder.
6. You can continue to add other projects in the same manner and format.


## Commands

### npm availableLinked

This lists the projects which are in the global modules folder which can be linked to. 

### npm dev

A shortcut to run the script 'npm run dev'

### npm linkTo

Creates a symlink from the current project to the global module folder. Needs to already have had the 'remote'
modules run 'npm link' in that directory. This will add the submitted package to the already linked packages, not overwrite them.

### npm unlinkTo

Removes a symlink from the current project to a linked project keeping all other linked projects.

## Changelog

0.0.3 - Added Audit, Install and Start, Fixed Typos.
