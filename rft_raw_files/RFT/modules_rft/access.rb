module Access

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