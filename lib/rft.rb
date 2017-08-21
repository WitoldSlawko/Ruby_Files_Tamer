require_relative "rft/version"
#require_relative "rft/options" # module Options
#require_relative "rft/access" # module Access
#require_relative "rft/mutation" # module Mutation

module Rft

 # include Options ------------------------------------

 def self.help
  puts "HELP. Use rft.rb with following commands: "
  puts " "
  puts "### Options Commands with 1 parameter ###"
  puts "$ rft -help # displays this info"
  puts "$ rft -folder # displays current working path"
  puts " "
  puts "### Options Commands with 2 parameters ###"
  puts "$ rft filename.format -props # displays file properties"
  puts " "
  puts "### Access Commands with 1 paramater ###"
  puts "$ rft filename.format # reads filename content"
  puts "$ rft --All # reads all files contents"
  puts "$ rft -list # lists all text-like files"
  puts " "
  puts "### Access Commands with 3 paramaters ###"
  puts "$ rft filename.format -find phrase # searches for phrase in file and, if spoted, displays the lines"
  puts "$ rft --All -find phrase # searches for phrase in all textlike files and, if spoted, displays the lines"
  puts "$ rftfilename.format -uniqs uniqsname.format # creates new file with uniq phrases only"
  puts " "
  puts "### Mutation Commands with 2 parameters ###"
  puts "$ rft filename.format -owtxt # overwrites text in file content by user input"
  puts "$ rft filename.format -apptxt # appends at the end of text in file content with user input"
  puts "$ rft filename.format -clr # clears the file content, and makes it a blank file"
  puts "$ rft filename.format -del # deletes the file"
  puts "$ rft --All -del # deletes all textlike files"
  puts "$ rft filename.format -new # creates new file by given filename.format" + '\n'
  puts " "
  puts "### Mutation Commands with 3 parameters ###"
  puts "$ rft filename.format -rename renamed.format # renames the file, can also change the format"
  puts "$ rft filename.format -rename renamed.format # renames the file, can also change the format"
  puts "$ rft filename.format -remove phrase # removes phrase from file"
  puts "$ rft --All -remove phrase # removes phrase from textlike files"
  puts "$ rft filename.format -copy new_file.format # copies all content from file to newly created new_file"
  puts " "
  puts "### Mutation Commands with 4 parameters ###"
  puts "$ rft filename.format -rep from_phrase to_phrase # find/replace words in file by provided from_/to_ phrases"
  puts "$ rft --All -rep from_phrase to_phrase # find/replace words in all textlike files by provided from_/to_ phrases"
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

 # include Mutation  ------------------------------------

def self.create(to_create)
  File.open(to_create, "w");
end

def self.overwrite_text(to_overwrite)
  puts "Write text to " + to_write + ' :'
  new_text = STDIN.gets.chomp
  File.open(to_write, "w").syswrite(new_text)
end

def self.append_text(to_write)
  puts "Append text to " + to_write + ' :'
  new_text = STDIN.gets.chomp
  File.open(to_write, "a+") do |line|
    line.puts "\n" + "Following text was added at: " +Time.now.inspect + " \n"+ new_text + "\n"
  end
end

def self.end_of_line(to_add, end_line)
  arr_lines = IO.readlines(to_add)
  arr_lines.each do |ending|
    ending += end_line
  end
  puts arr_lines
  end_file = File.new(to_add, "w+")
  for ender in 0...arr_lines.length
    end_file.syswrite(arr_lines[ender])
  end
end

def self.clear_text(to_clear)
  File.open(to_clear, "w").syswrite('')
end

def self.rename(from, to)
  File.rename(from, to)
end

def self.replace(to_rep, with_word)
  if to_rep.is_a? String
    arr_lines = IO.readlines(to_rep)
    arr_lines.each do |replacer|
      replacer.gsub!(/#{ARGV[2]}/, with_word )
    end
    rep_file = File.new(to_rep, "w");
    for rep in 0...arr_lines.length do
      rep_file.syswrite(arr_lines[rep])
    end
  elsif to_rep.is_a? Array
    to_rep.each do |replacement|
      arr_lines = IO.readlines(replacement)
      arr_lines.each do |replacer|
        replacer.gsub!(/#{ARGV[2]}/, with_word )
      end
      rep_file = File.new(replacement, "w");
      for rep in 0...arr_lines.length do
        rep_file.syswrite(arr_lines[rep])
      end
    end
  end
end

def self.copy(to_copy, new_name)
  arr_lines = IO.readlines(to_copy)
  rep_file = File.new(new_name, "w");
    for rep in 0...arr_lines.length do
      rep_file.syswrite(arr_lines[rep])
    end
end

def self.remove(to_file, to_remove)
  if to_file.is_a? String
    arr_lines = IO.readlines(to_file)
    arr_lines.each do |remover|
      remover.gsub!(/#{to_remove}/, '' )
    end
    rep_file = File.new(to_file, "w");
    for rep in 0...arr_lines.length do
      rep_file.syswrite(arr_lines[rep])
    end
  elsif to_remove.is_a? Array
    to_remove.each do |removement|
      arr_lines = IO.readlines(removement)
      arr_lines.each do |remover|
        remover.gsub!(/#{to_remove}/, '' )
      end
      rep_file = File.new(removement, "w");
      for rep in 0...arr_lines.length do
        rep_file.syswrite(arr_lines[rep])
      end
    end
  end
end

def self.del(to_delete)
  if to_delete.is_a? String
    File.delete(to_delete)
  elsif to_delete.is_a? Array
    to_delete.each do |to_del|
      File.delete(to_del)
    end
  end
end
 # include Access
 #module Access
  
    def self.reader(to_read)
      if to_read.is_a? String
        num_lines = 0
        puts $folder_path + '/' + to_read
        File.open(to_read, "r").each do |line|
          puts "#{num_lines += 1} | " + line
        end
      elsif to_read.is_a? Array
        to_read.each do |file|
          self.reader(file)
          puts ' '
        end
      end
    end
  
    def self.seeker(to_seek)
      if to_seek.is_a? String
        num_lines = 0
        puts $path_file
        File.open(to_seek, "r").each do |line|
          "#{num_lines += 1} | " + line
          print "#{num_lines} | " + line  if line.include? ARGV[2]
        end
      elsif to_seek.is_a? Array
        path = File.expand_path File.dirname(__FILE__)
        to_seek.each do |file|
          print path + '/' + file
          self.seeker(file)
          puts ' '
        end
      end
    end
  
    def self.uniqs(to_uniq, the_uniqs)
      if to_uniq.is_a? String
        arr_lines = IO.readlines(to_uniq)
        arr_flat = []
        for unq in 0...arr_lines.length do
          arr_flat << arr_lines[unq].split(" ")
          arr_flat.uniq!
        end
        arr_flat.flatten!
        uniqs_file = File.new(the_uniqs, "w")
        for un in 0...arr_flat.length do
          uniqs_file.syswrite(arr_flat[un] + "\n")
        end
      end
    end
  
  
end
