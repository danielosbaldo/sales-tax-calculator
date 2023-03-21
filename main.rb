# main.rb
require_relative 'item'
require_relative 'receipt'

def main
  receipt = Receipt.new

  puts "Enter the items (type 'done' when finished):"

  loop do
    line = gets.strip
    break if line.downcase == 'done'

    receipt.add_item(line)
  end

  receipt.print
end

main
