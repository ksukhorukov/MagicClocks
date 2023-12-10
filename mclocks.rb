#!/usr/bin/env ruby

require 'colorize'
require 'pry'

class MagicClocks
  COLORS = [:green, :red, :blue, :yellow]

  attr_reader :builded_magic, :color

  def initialize
    @color = COLORS.sample

    build_magic
  end 

  def display_magic 
    random_color
    moto
    builded_magic.each { |val| puts "\t#{' ' * 6}#{val}".colorize(color: color, mode: :bold) }
  end 

  private 

  def moto 
    puts "\n\t.::MAGIC CLOCKS::.\n".colorize(color: color, mode: :bold)
  end 

  def random_color
    @color = ::MagicClocks::COLORS.sample
  end 

  def formatted_time(h, m)
    h = '0' + h.to_s if h.to_s.split('').size < 2
    m = '0' + m.to_s if m.to_s.split('').size < 2

    return "#{h}:#{m}"
  end 

  def build_magic
    return builded_magic unless @builded_magic.nil?

    @builded_magic = []

    for h in 1..24 do 
      for m in 1..60 do 
        @builded_magic << formatted_time(h, m) if h == m
      end
    end
    
    @builded_magic
  end 
end



magick_clocks = MagicClocks.new 

while(true) do 
  system('clear')
  magick_clocks.display_magic
  sleep(0.2)
end