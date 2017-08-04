# Ruby Files Tamer - ver. beta

# $file_name = ARGV[0] if File.file? ARGV[0]
#$path_file = File.expand_path File.dirname(__FILE__);
#puts $path_file
#Dir.chdir ($path_file)
#Dir.chdir("../")
#puts Dir.pwd

require_relative 'modules_rft/options' # module Options
require_relative 'modules_rft/access' # module Access
require_relative 'modules_rft/mutation' # module Mutation

def list
    dir = Dir.entries(File.expand_path File.dirname(__FILE__)).join(' ').split(' ')
    dir.delete('.') if dir.include? '.'
    dir.delete('..') if dir.include? '..'
    dir.each do |rm_file|
      dir.delete(rm_file) unless rm_file.include? '.'
    end
    dir.sort!
  end

if File.file? ARGV[0]
  $file_name = ARGV[0]
  $path_file = File.expand_path File.dirname(__FILE__) + '/' +ARGV[0] 
end

case ARGV.length

when 1
  Access.reader($file_name) if File.file? ARGV[0]

  case ARGV[0]
    when '-ls' then puts list
    when '-h' then Options.help
    when '--A' then Access.reader(list)
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
      when '-rn' then Mutation.rename($file_name, ARGV[2])
      else Options.syntax_error
    end
  elsif ARGV[0] == '--A'
    case ARGV[1]
      when '-find' then Access.seeker(list)
      else Options.syntax_error
    end
  end
  
when 4
  if File.file? ARGV[0]
    case ARGV[1]
    when '-rep' then replace($file_name)
    else Options.syntax_error
    end
  elsif
    case ARGV[1]
    when '-rep' then replace(list)
    else Options.syntax_error
    end
  end

end
