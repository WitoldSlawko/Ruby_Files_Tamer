# Ruby_Files_Tamer
Ruby project with File I/O handling.

### Check for RFT/rft.rb ###

### HELP. Use rft.rb with following commands: ###

### Options Commands with 1 parameter ###
ruby RFT/rft.rb -help # displays this info <br />
ruby RFT/rft.rb -folder # displays current working path <br />

### Options Commands with 2 parameters ###
ruby RFT/rft.rb filename.format -props # displays file properties <br />

### Access Commands with 1 paramater ###
ruby RFT/rft.rb filename.format # reads filename content <br />
ruby RFT/rft.rb --All # reads all files contents <br />
ruby RFT/rft.rb -list # lists all text-like files <br />

### Access Commands with 3 paramaters ###
ruby RFT/rft.rb filename.format -find phrase # searches for phrase in file and, if spoted, displays the lines <br />
ruby RFT/rft.rb --All -find phrase # searches for phrase in all textlike files and, if spoted, displays the lines <br />

### Mutation Commands with 2 parameters ###
ruby RFT/rft.rb filename.format -owtxt # overwrites text in file content by user input <br />
ruby RFT/rft.rb filename.format -apptxt # appends at the end of text in file content with user input <br />
ruby RFT/rft.rb filename.format -clr # clears the file content, and makes it a blank file <br />
ruby RFT/rft.rb filename.format -del # deletes the file <br />
ruby RFT/rft.rb --All -del # deletes all textlike files <br />
ruby RFT/rft.rb filename.format -new # creates new file by given filename.format <br />

### Mutation Commands with 3 parameters ###
ruby RFT/rft.rb filename.format -rename renamed.format # renames the file, can also change the format <br />
ruby RFT/rft.rb filename.format -rename renamed.format # renames the file, can also change the format <br />
ruby RFT/rft.rb filename.format -remove phrase # removes phrase from file <br />
ruby RFT/rft.rb --All -remove phrase # removes phrase from textlike files <br />
ruby RFT/rft.rb filename.format -copy new_file.format # copies all content from file to newly created new_file <br />

### Mutation Commands with 4 parameters ###
ruby RFT/rft.rb filename.format -rep from_phrase to_phrase # find/replace words in file by provided from_/to_ phrases <br />
ruby RFT/rft.rb --All -rep from_phrase to_phrase # find/replace words in all textlike files by provided from_/to_ phrases <br />

