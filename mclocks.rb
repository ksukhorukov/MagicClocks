#!/usr/bin/env ruby

require 'colorize'

class MagicClocks
  def initialize
    display_magic 
  end 

  private 

  def display_magic 
    puts "\n\t.::MAGIC CLOCKS::.\n".colorize(color: :green, mode: :bold)
    for h in 1..24 do 
      for m in 1..60 do 
        puts "\t       #{formatted_time(h, m)}".colorize(color: :green, mode: :bold) if h == m
      end
    end
    puts "\n"
  end 

  def formatted_time(h, m)
    h = '0' + h.to_s if h.to_s.split('').size < 2
    m = '0' + m.to_s if m.to_s.split('').size < 2

    return "#{h}:#{m}"
  end 
end

MagicClocks.new