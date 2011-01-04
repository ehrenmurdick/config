$: << '/Users/ehrenmurdick/lib/ruby'
require 'rubygems'
require 'irb/completion'
# require 'lazy'

print "\e]1;irb\a"



FAKE_FALSE = ENV["FALSE"] || "kumquat"
FAKE_TRUE = ENV["TRUE"] || "banana"



IRB.conf[:IRB_RC] = proc do |conf|
  name = "irb: "
  leader = " " * name.length
  conf.prompt_i = "#{name}"
  conf.prompt_s = leader + '\-" '
  conf.prompt_c = leader + '\-+ '
  conf.return_format = ('=' * (name.length - 2)) + "> %s\n"
end


# Setup permanent history.
HISTFILE = "~/.irb_history"
MAXHISTSIZE = 500
begin
  histfile = File::expand_path(HISTFILE)
  if File::exists?(histfile)
    lines = IO::readlines(histfile).collect { |line| line.chomp }
    puts "Read #{lines.nitems} saved history commands from '#{histfile}'." if $VERBOSE
    Readline::HISTORY.push(*lines)
  else
    puts "History file '#{histfile}' was empty or non-existant." if $VERBOSE
  end
  Kernel::at_exit do
    lines = Readline::HISTORY.to_a.reverse.uniq.reverse
    lines = lines[-MAXHISTSIZE, MAXHISTSIZE] if lines.nitems > MAXHISTSIZE
    puts "Saving #{lines.length} history lines to '#{histfile}'." if $VERBOSE
    File::open(histfile, File::WRONLY|File::CREAT|File::TRUNC) { |io| io.puts lines.join("\n") }
  end
end


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

ANSI_BOLD       = "\033[1m"
ANSI_RESET      = "\033[0m"
ANSI_LGRAY    = "\033[0;37m"
ANSI_GRAY     = "\033[1;30m"

def pm(obj, *options) # Print methods
  methods = obj.methods
  methods -= Object.methods unless options.include? :more
  filter = options.select {|opt| opt.kind_of? Regexp}.first
  methods = methods.select {|name| name =~ filter} if filter

  data = methods.sort.collect do |name|
    method = obj.method(name)
    if method.arity == 0
      args = "()"
    elsif method.arity > 0
      n = method.arity
      args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")})"
    elsif method.arity < 0
      n = -method.arity
      args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")}, ...)"
    end
    klass = $1 if method.inspect =~ /Method: (.*?)#/
    [name, args, klass]
  end
  max_name = data.collect {|item| item[0].size}.max
  max_args = data.collect {|item| item[1].size}.max
  data.each do |item| 
    print " #{ANSI_BOLD}#{item[0].rjust(max_name)}#{ANSI_RESET}"
    print "#{ANSI_GRAY}#{item[1].ljust(max_args)}#{ANSI_RESET}"
    print "   #{ANSI_LGRAY}#{item[2]}#{ANSI_RESET}\n"
  end
  data.size
end



if $0 == 'irb' && ENV['RAILS_ENV'] 
  load File.dirname(__FILE__) + '/.railsrc' 
else
  require 'active_support'
end

