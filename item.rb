# frozen_string_literal: true

# Item class represents a product with its associated attributes and methods
# for calculating sales tax based on its price, import status, and tax exemption.
#
require_relative 'tax_calculator'

class Item
  attr_accessor :name, :quantity, :price, :imported, :tax_exempt

  def initialize(params)
    @name = params[:name]
    @quantity = params[:quantity]
    @price = params[:price]
    @imported = params[:imported]
    @tax_exempt = params[:tax_exempt]
    @tax_calculator = params[:tax_calculator]
  end

  def sales_tax
    @tax_calculator.calculate_tax(price, imported, tax_exempt)
  end

  def total_price
    (price * quantity) + sales_tax
  end
end
