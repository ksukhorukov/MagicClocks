#!/usr/bin/env ruby

require 'colorize'
require 'pry'

class MagicClocks
  attr_reader :builded_magic

  def initialize
    build_magic
  end 

  def display_magic 
    puts "\n\t.::MAGIC CLOCKS::.\n".colorize(color: :green, mode: :bold)
    builded_magic.each { |val| puts "\t#{' ' * 6}#{val}".colorize(color: :green, mode: :bold) }
    puts "\n"
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

MagicClocks.new.display_magic