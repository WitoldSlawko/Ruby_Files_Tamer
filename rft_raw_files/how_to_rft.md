# Ruby_Files_Tamer
Ruby project with File I/O handling.

### Options Commands with 1 parameter ###
$ rft -help # displays this info <br />
$ rft -folder # displays current working path <br />

### Options Commands with 2 parameters ###
$ rft filename.format -props # displays file properties <br />

### Access Commands with 1 paramater ###
$ rft filename.format # reads filename content <br />
$ rft --All # reads all files contents <br />
$ rft -list # lists all text-like files <br />

### Access Commands with 3 paramaters ###
$ rft filename.format -find phrase # searches for phrase in file and, if spoted, displays the lines <br />
$ rft --All -find phrase # searches for phrase in all textlike files and, if spoted, displays the lines <br />
$ rftfilename.format -uniqs uniqsname.format # creates new file with uniq phrases only <br />

### Mutation Commands with 2 parameters ###
$ rft filename.format -owtxt # overwrites text in file content by user input <br />
$ rft filename.format -apptxt # appends at the end of text in file content with user input <br />
$ rft filename.format -clr # clears the file content, and makes it a blank file <br />
$ rft filename.format -del # deletes the file <br />
$ rft --All -del # deletes all textlike files <br />
$ rft filename.format -new # creates new file by given filename.format <br />

### Mutation Commands with 3 parameters ###
$ rft filename.format -rename renamed.format # renames the file, can also change the format <br />
$ rft filename.format -rename renamed.format # renames the file, can also change the format <br />
$ rft filename.format -remove phrase # removes phrase from file <br />
$ rft --All -remove phrase # removes phrase from textlike files <br />
$ rft filename.format -copy new_file.format # copies all content from file to newly created new_file <br />

### Mutation Commands with 4 parameters ###
$ rft filename.format -rep from_phrase to_phrase # find/replace words in file by provided from_/to_ phrases <br />
$ rft --All -rep from_phrase to_phrase # find/replace words in all textlike files by provided from_/to_ phrases <br />

