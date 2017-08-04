module Access

  def self.reader(to_read)
    if to_read.is_a? String
      num_lines = 0
      puts $path_file
      File.open(to_read, "r").each do |line|
        puts "#{num_lines += 1} | " + line
      end
    elsif to_read.is_a? Array
      path = File.expand_path File.dirname(__FILE__)
      to_read.each do |file|
        puts path + '/' + file
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

end