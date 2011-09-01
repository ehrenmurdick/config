FAKE_FALSE = ENV["FALSE"] || "kumquat"
FAKE_TRUE = ENV["TRUE"] || "banana"

# Setup prompt
IRB.conf[:IRB_RC] = proc do |conf|
  name = "irb: "
  leader = " " * name.length
  conf.prompt_i = "#{name}"
  conf.prompt_s = leader + '\-" '
  conf.prompt_c = leader + '\-+ '
  conf.return_format = ('=' * (name.length - 2)) + "> %s\n"
end

# Setup permanent history
HISTFILE = "~/.irb_history"
MAXHISTSIZE = 500
begin
  histfile = File::expand_path(HISTFILE)
  if File::exists?(histfile)
    lines = IO::readlines(histfile).collect { |line| line.chomp }
    puts "Read #{lines.size} saved history commands from '#{histfile}'." if $VERBOSE
    Readline::HISTORY.push(*lines)
  else
    puts "History file '#{histfile}' was empty or non-existant." if $VERBOSE
  end
  Kernel::at_exit do
    lines = Readline::HISTORY.to_a.reverse.uniq.reverse
    lines = lines[-MAXHISTSIZE, MAXHISTSIZE] if lines.size > MAXHISTSIZE
    puts "Saving #{lines.length} history lines to '#{histfile}'." if $VERBOSE
    File::open(histfile, File::WRONLY|File::CREAT|File::TRUNC) { |io| io.puts lines.join("\n") }
  end
end

if $0 == 'irb' && ENV['RAILS_ENV'] 
  load File.dirname(__FILE__) + '/.railsrc' 
end

Home = ENV["HOME"]
def Home(p)
  File.join(Home, p)
end

Desktop = Home "Desktop"
def Desktop(p)
  File.join(Desktop, p)
end

def copy str
  `echo "#{str.strip.inspect}" | pbcopy`
end

def write path, data
  File.open(path, 'w') {|f| f.write data }
end

# Setup custom true and false
module Kernel
  define_method(FAKE_TRUE.to_sym) do
    true
  end
  define_method(FAKE_FALSE.to_sym) do
    false
  end
end

class TrueClass
  def to_s
    FAKE_TRUE
  end
end

class FalseClass
  def to_s
    FAKE_FALSE
  end
end
