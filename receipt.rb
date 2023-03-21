# frozen_string_literal: true

# receipt class represents a collection of items and methods for calculating
# sales tax and total price for all items.
#
require_relative 'tax_calculator'

class Receipt
  def initialize
    @items = []
    @tax_calculator = TaxCalculator.new(0.10, 0.05)
  end

  def add_item(line)
    quantity, imported, name, price = parse_line(line)
    tax_exempt = exempt?(name)
    @items << Item.new(
      name: name,
      quantity: quantity,
      price: price,
      imported: imported,
      tax_exempt: tax_exempt,
      tax_calculator: @tax_calculator
    )
  end

  def print
    total_price = 0
    total_tax = 0

    @items.each do |item|
      puts "#{item.quantity} #{item.name}: #{format('%.2f', item.total_price)}"
      total_price += item.total_price
      total_tax += item.sales_tax
    end

    puts "Sales Taxes: #{format('%.2f', total_tax)}"
    puts "Total: #{format('%.2f', total_price)}"
  end

  private

  def parse_line(line)
    match = /^(\d+) (imported\s)?([\w\s]+) at (\d+\.\d+)$/.match(line)
    quantity = match[1].to_i
    imported = !match[2].nil?
    name = match[3]
    price = match[4].to_f
    [quantity, imported, name, price]
  end

  def exempt?(name)
    categories = ['book', 'chocolate', 'headache pills']
    categories.any? { |category| name.include?(category) }
  end
end
