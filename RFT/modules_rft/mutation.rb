module Mutation

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

end