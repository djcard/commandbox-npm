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
4. (optional) In your main project, use the command ```NPM availableLinked``` and you should see a reference to your other package.
5. Still in your main project, run ```NPM linkto << name of other project >>```. You can use this name alone, even if there are other projects. Example:  In C:\myroot\mainproject type ```NPM linkto iwanttoincludethis```.
6. (optional) Still in your main project, run ```NPM projectLinked``` to what to what other projects your main one is linked. You should see ```iwanttoincludethis```. You should also see the folder iwanttoincludethis in your main projects node_modules folder.
7. You can continue to add other projects in the same manner and format.

## Commands

### npm audit

This runs the audit command with an option ```fix``` flag

### npm availableLinked

This lists the projects which are in the global modules folder which can be linked to.

### npm bump

This uses the npm bump command to adjust the semver version. Options include major,minor,patch,premajor,preminor,prepatch,prerelease,from-git

### npm dev

A shortcut to run the script 'npm run dev'. Not all scripts have a specific implementation like this but 'dev' is common enough with libraries like vite that it made for a convenient short cut. To run other scripts use ```npm script << name >>```

### npm install

Runs the underlying ```npm install``` command to install the needed packages from the package.json file.

### npm link

Adds the current project to the global node_modules which allows it to be linked to by other projects

### npm linkTo

Creates a symlink from the current project to the global module folder. Needs to already have had the 'remote'
modules run 'npm link' in that directory. This will add the submitted package to the already linked packages, not overwrite them.

### npm login

Prompts for username and password in order to authenticate to npmjs. Facilitates the publish command

### npm projectLinked

Displays the projects to which the current project is linked ( i.e. This project is linked to the following other ones....). Note: The display on this is sometimes 'broken' because the referenced project is a different version than is in the current folder's package.json. For example, if the linked project has been updated and it's semver bumped up. The current project might have a previous version in the package.json so it appears to be broken. One solutions is to update the current projects' package.json to match what is in the linked folder. If it is necessary to remain on a previous version, unlink the project and install that older version instead. 

### npm publish

Publishes the current folder to npm. Note: This ONLY does the current project. It does not cascade down the linked projects. Those must be published on their own. Any errors or problem from npmjs will be shown. You must be authenticated to do this. 

### npm run << scriptName >>

Runs a script defined in the package.json

### npm start

Much like ```NPM dev``` this is a special case which runs the script 'start' if it is configured in the package.json. Helpful use case when using frameworks which use this often. 

### npm unlinkTo

Removes a symlink from the current project to a linked project keeping all other linked projects.

### npm whoAmI

Displays the user authenticated to npm

## Changelog

0.0.3 - Added Audit, Install and Start, Fixed Typos.

0.0.4 - Added run command and expanded the README.md document
