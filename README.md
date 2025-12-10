# NPM

CommandBox-NPM is a CommandBox tool meant facilitate select commands which are normally run from the npm cli
but are made available here in order to have less windows open. For the most part the commands mirror what is
located at https://docs.npmjs.com/cli/v11/commands with a few exceptions listed below.

## Commands

### npm availableLinked

This lists the projects which are in the global modules folder which can be linked to. 

### Dev

A shortcut to run the script 'npm run dev'

### LinkTo

Creates a symlink from the current project to the global module folder. Needs to already have had the 'remote'
modules run 'npm link' in that directory. This will add the submitted package to the already linked packages, not overwrite them. 

### UnlinkTo 

Removes a symlink from the current project to a linked project keeping all other linked projects.