module Options

  def self.help
    puts "HELP. Use rft.rb with following commands: "
    puts " "
    puts "### Options Commands with 1 parameter ###"
    puts "$ ruby RFT/rft.rb -help # displays this info"
    puts "$ ruby RFT/rft.rb -folder # displays current working path"
    puts " "
    puts "### Options Commands with 2 parameters ###"
    puts "$ ruby RFT/rft.rb filename.format -props # displays file properties"
    puts " "
    puts "### Access Commands with 1 paramater ###"
    puts "$ ruby RFT/rft.rb filename.format # reads filename content"
    puts "$ ruby RFT/rft.rb --All # reads all files contents"
    puts "$ ruby RFT/rft.rb -list # lists all text-like files"
    puts " "
    puts "### Access Commands with 3 paramaters ###"
    puts "$ ruby RFT/rft.rb filename.format -find phrase # searches for phrase in file and, if spoted, displays the lines"
    puts "$ ruby RFT/rft.rb --All -find phrase # searches for phrase in all textlike files and, if spoted, displays the lines"
    puts "$ ruby RFT/rft.rbfilename.format -uniqs uniqsname.format # creates new file with uniq phrases only"
    puts " "
    puts "### Mutation Commands with 2 parameters ###"
    puts "$ ruby RFT/rft.rb filename.format -owtxt # overwrites text in file content by user input"
    puts "$ ruby RFT/rft.rb filename.format -apptxt # appends at the end of text in file content with user input"
    puts "$ ruby RFT/rft.rb filename.format -clr # clears the file content, and makes it a blank file"
    puts "$ ruby RFT/rft.rb filename.format -del # deletes the file"
    puts "$ ruby RFT/rft.rb --All -del # deletes all textlike files"
    puts "$ ruby RFT/rft.rb filename.format -new # creates new file by given filename.format" + '\n'
    puts " "
    puts "### Mutation Commands with 3 parameters ###"
    puts "$ ruby RFT/rft.rb filename.format -rename renamed.format # renames the file, can also change the format"
    puts "$ ruby RFT/rft.rb filename.format -rename renamed.format # renames the file, can also change the format"
    puts "$ ruby RFT/rft.rb filename.format -remove phrase # removes phrase from file"
    puts "$ ruby RFT/rft.rb --All -remove phrase # removes phrase from textlike files"
    puts "$ ruby RFT/rft.rb filename.format -copy new_file.format # copies all content from file to newly created new_file"
    puts " "
    puts "### Mutation Commands with 4 parameters ###"
    puts "$ ruby RFT/rft.rb filename.format -rep from_phrase to_phrase # find/replace words in file by provided from_/to_ phrases"
    puts "$ ruby RFT/rft.rb --All -rep from_phrase to_phrase # find/replace words in all textlike files by provided from_/to_ phrases"
  end

  def  self.folder
    puts $folder_path
  end

  def self.properties(file_props)
    puts "Name: " + file_props
    puts "Type: " + File::ftype(file_props)
    puts "Format: " + file_props[file_props.index('.')+1, file_props.length-1]
    puts "Empty? " + File.zero?(file_props).to_s
    if File.size?(file_props) < 1024
      puts "Size: " + File.size?(file_props).to_s + ' bytes'
    elsif File.size?(file_props) >= 1024 && File.size?(file_props) < (1024**2)
      puts "Size: " + (File.size?(file_props)/1024.0).ceil(2).to_s + ' KB'
    else File.size?(file_props) >= (1024**2)
      puts "Size: " + (File.size?(file_props)/(1024.0**2)).ceil(2).to_s + ' MB'
    end
    puts "Readable? " + File.readable?(file_props).to_s
    puts "Writable? " + File.writable?(file_props).to_s
    puts "Executable? " + File.executable?(file_props).to_s
    puts "Created: " + File::ctime(file_props).to_s
    puts "Modified: " + File::mtime(file_props).to_s
    puts "Accessed: " + File::atime(file_props).to_s
  end

  def self.syntax_error
    puts "RFT: Wrong syntax! Type: $ ruby rft.rb -h # for help!"
  end

end