module Options

  def self.help
    puts "Help. Use RFT.rb with following commands: "
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
    puts "Created: " + File::ctime(file_props).to_s
    puts "Modified: " + File::mtime(file_props).to_s
    puts "Accessed: " + File::atime(file_props).to_s
  end

  def self.syntax_error
    puts "RFT: Wrong syntax! Type: >> $ ruby rft.rb -h # for help!"
  end

end