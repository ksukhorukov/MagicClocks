#!/usr/bin/env ruby

require 'colorize'
require 'pry'

DELAY = 0.333333333333

class MagicClocks
  COLORS = [:green, :red, :blue]
  ALIGN_TABS = 11
  ALIGN_SPACES = 7

  attr_reader :builded_magic, :color

  def initialize
    @color = COLORS.sample

    build_magic
  end 

  def display_magic 
    random_color
    moto
    builded_magic.each { |val| puts "#{"\t" * ALIGN_TABS }#{' ' * ALIGN_SPACES}#{val}".colorize(color: color, mode: :bold) }
  end 

  private 

  def moto 
    puts "\n#{"\t" * ALIGN_TABS }.::MAGIC CLOCKS::.\n".colorize(color: color, mode: :bold)
  end 

  def random_color
    @color = ::MagicClocks::COLORS.sample
  end 

  def formatted_time(h, m)
    h = '0' + h.to_s if h.to_s.split('').size < 2
    m = '0' + m.to_s if m.to_s.split('').size < 2

    return "#{h}:#{m}"
  end 

  def parts_equal?(str)
    data = str.split(/:/)
    data[0] == data[1]
  end 

  def hours_equals_minutes?(h, m)
    h == m
  end


  def build_magic
    return builded_magic unless @builded_magic.nil?

    @builded_magic = []

    for h in 1..24 do 
      for m in 1..60 do 
       _h_m_formatted = formatted_time(h, m) 

       if h == m
         _formated = formatted_time(h, m)
         @builded_magic <<  _formated if hours_equals_minutes?(h, m) or parts_equal?(_formated)
        end
      end
    end
    @builded_magic.uniq!
    @builded_magic
  end 
end



magick_clocks = MagicClocks.new 

while(true) do 
  system('clear')
  magick_clocks.display_magic
  sleep(DELAY)
end