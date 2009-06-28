require 'rubygems'
require 'irb/completion'


FAKE_FALSE = ENV["FALSE"] || "kumquat"
FAKE_TRUE = ENV["TRUE"] || "banana"

HOME = ENV["HOME"]
DESKTOP = File.join(HOME, "Desktop")

def Desktop str
  File.join(DESKTOP, str.to_s)
end
Desktop = File.join(DESKTOP, "")


def time_it(times=1)
  require "benchmark"
  ret = nil
  Benchmark.bm { |x| x.report { times.times { ret = yield } } }
  ret
end

IRB.conf[:IRB_RC] = proc do |conf|
  name = "irb: "
  name = "rails: " if $0 == 'irb' && ENV['RAILS_ENV']
  leader = " " * name.length
  conf.prompt_i = "#{name}"
  conf.prompt_s = leader + '\-" '
  conf.prompt_c = leader + '\-+ '
  conf.return_format = ('=' * (name.length - 2)) + "> %s\n"
end

def working! indicator = :spinner, iterations = nil
  case indicator
  when :spinner
    print " " unless @_status
    @_status ||= ['/', '-', '\\', "|"] 
    @index ||= 0
    @index += 1 if @index < @_status.size
    @index = 0 if @index == @_status.size
    print "\b#{@_status[@index]}"

  when :dots
    print '.'

  when :bar
    raise ArgumentError, "Progress Bar requires number of iterations! (second argument)" if iterations.nil?
    unless @one_bar
      @total_bars = iterations
      @one_bar = 1
      while @total_bars > 30
        @total_bars /= 2
        @one_bar *= 2
      end
      while @total_bars < 30
        @total_bars *= 2
        @one_bar /= 2.0
      end
      @bars_to_print = 0
      @current  = 0
    end
    @current += 1
    if @current % @one_bar == 0 
      @bars_to_print += 1 / @one_bar if @one_bar < 1
      @bars_to_print += 1 if @one_bar >= 1
    end rescue false

    bars = @bars_to_print
    print "\r|#{'=' * bars}#{' ' * (@total_bars - bars.truncate) rescue ''}|"

    if @current == iterations
      @one_bar = nil
      print "\n"
    end
  end
end

def notify str, sticky = false
  ruby_icon = "/Users/ehrenmurdick/Pictures/ruby.png"
  %x{echo #{str.inspect} | growlnotify -t "iRB" --image #{ruby_icon} #{sticky ? '-sticky' : ''}}
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



class Time
  class << self
    def meow
      now
    end
  end
end
Right = Time

module Kernel
  define_method(FAKE_TRUE.to_sym) do
    true
  end
  define_method(FAKE_FALSE.to_sym) do
    false
  end
end

class Object
  def m
    (methods - self.class.instance_methods).sort
  end

  def i
    (instance_methods - Object.instance_methods).sort
  end

  def c
    constants.sort {|a, b| a.to_s <=> b.to_s }
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

if $0 == 'irb' && ENV['RAILS_ENV'] 
  load File.dirname(__FILE__) + '/.railsrc' 
else
  require 'activesupport'
end
