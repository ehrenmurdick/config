MODEL_NAMES = %w{User Event Network}
FAKE_FALSE = ENV["FALSE"] || "kumquat"
FAKE_TRUE = ENV["TRUE"] || "banana"

require 'rubygems'
require 'irb/completion'

def working! indicator = :spinner, iterations = nil
  case indicator
  when :spinner
    print " " unless @_status
    @_status ||= ['/', '-', '\\'] 
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
    print "\r|#{'=' * bars}#{' ' * (@total_bars - bars.truncate)}|"

    if @current == iterations
      @one_bar = nil
      print "\n"
    end
  end
end

def test n
  n.times { working! :bar, n; sleep 0.05}
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

@can_be_numeric = Object.new
def @can_be_numeric.===(other) 
  other.to_i if other =~ /^\d*$/ or Numeric === other
end

def m obj
  (obj.methods - obj.class.instance_methods).sort
end

def i(obj)
  (obj.class.instance_methods - obj.class.superclass.instance_methods).sort
end


module Finder
  def columns_which_are(t)
    types = nil
    case t
    when :string
      types = [:string, :text]
    when :numeric
      types = [:integer]
    when :datetime
      types = [:date, :time, :datetime]
    end

    columns.find_all {|c| types.include?(c.type) }.map(&:name)
  end
end

def run_finders(model, colgroup, arg)
  result = nil
  colgroup.each do |col|
    begin
      result = model.send("find_by_#{col}", arg)
    rescue NoMethodError
    end
    break if result
  end
  result
end


MODEL_NAMES.each do |model_name|
  if defined?(model_name)
    src =<<-END
      def #{model_name}(arg)
        #{model_name}.extend(Finder) unless #{model_name}.included_modules.include?(Finder)
        result = nil
        case arg
        when @can_be_numeric
          run_finders(#{model_name}, #{model_name}.columns_which_are(:numeric), arg)
        when String
          run_finders(#{model_name}, #{model_name}.columns_which_are(:string), arg)
        end
      end
    END
    eval src
  end
end

class Object
  def meow?
    !blank?
    %x{ say meow } if !blank?
  end
end

class Numeric
  def meows
    self.times do
      %x{ say meow }
    end
  end
end

class Time
  class << self
    def meow
      now
    end
  end
end

class Object
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
