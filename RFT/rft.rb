# Ruby Files Tamer - ver. beta

BEGIN {

  require_relative 'modules_rft/options' # module Options
  require_relative 'modules_rft/access' # module Access
  require_relative 'modules_rft/mutation' # module Mutation

  $rft_path = File.expand_path File.dirname(__FILE__)
  
  Dir.chdir ($rft_path)
  Dir.chdir("../")

  $folder_path = Dir.pwd

  if File.file?(ARGV[0]) && ['.txt', '.md', '.otd', '.doc', '.docx'].any? { |format| ARGV[0].include?(format) }
    $file_name = ARGV[0]
    $file_path = File.expand_path File.dirname(__FILE__) + '/' +ARGV[0] 
  end

}

def list
    dir = Dir.entries($folder_path).join(' ').split(' ')
    dir.delete('.') if dir.include? '.'
    dir.delete('..') if dir.include? '..'
    dir.each do |rm_file|
      dir.delete(rm_file) unless rm_file.include? '.'
      #dir.delete(rm_file) unless ['.txt', '.md', '.otd', '.doc', '.docx'].any? { |inc| rm_file.include? inc }
    end
    #dir.sort!
    dir.each do |rm_file|
      #dir.delete(rm_file) unless rm_file.include? '.'
      dir.delete(rm_file) unless ['.txt', '.md', '.otd', '.doc', '.docx'].any? { |inc| rm_file.include? inc }
    end
    dir.sort!
  end

case ARGV.length

when 1
  Access.reader($file_name) if File.file? ARGV[0]

  case ARGV[0]
    when '-list' then puts list
    when '-help' then Options.help
    when '--All' then Access.reader(list)
    when '-folder' then Options.folder
  end

when 2
  if File.file? ARGV[0]
    case ARGV[1]
      when '-props' then Options.properties($file_name)
      when '-owtxt' then Mutation.overwrite_text($file_name)
      when '-apptxt' then Mutation.append_text($file_name)
      when '-clr' then Mutation.clear_text($file_name)
      when '-del' then Mutation.del($file_name)
      else Options.syntax_error
    end
  elsif ARGV[0] == '--A'
    case ARGV[1]
      when '-del' then Mutation.del(list)
      else Options.syntax_error
    end
  elsif ARGV[0] == '-new'
    unless list.include? ARGV[1]
      Mutation.create(ARGV[1])
    else
      puts "File " + ARGV[1] + " already exist!"
    end
  end

when 3
  if File.file? ARGV[0]
    case ARGV[1]
      when '-find' then Access.seeker($file_name)
      when '-rename' then Mutation.rename($file_name, ARGV[2])
      when '-copy' then Mutation.copy($file_name, ARGV[2])
      when '-remove' then Mutation.remove($file_name, ARGV[2])
      else Options.syntax_error
    end
  elsif ARGV[0] == '--All'
    case ARGV[1]
      when '-find' then Access.seeker(list)
      when '-remove' then Mutation.remove(list, ARG[2])
      else Options.syntax_error
    end
  end
  
when 4
  if File.file? ARGV[0]
    case ARGV[1]
    when '-rep' then replace($file_name, ARGV[3])
    else Options.syntax_error
    end
  elsif ARGV[0] == '--A'
    case ARGV[1]
    when '-rep' then replace(list, ARGV[3])
    else Options.syntax_error
    end
  end

end
