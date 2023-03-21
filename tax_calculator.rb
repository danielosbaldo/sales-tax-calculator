# frozen_string_literal: true

# tax_calculator.rb
class TaxCalculator
  def initialize(base_tax, import_tax)
    @base_tax = base_tax
    @import_tax = import_tax
  end

  def calculate_tax(price, imported, tax_exempt)
    tax = 0
    tax += @base_tax unless tax_exempt
    tax += @import_tax if imported
    round_up(price * tax)
  end

  private

  def round_up(value, step = 0.05)
    (value * (1.0 / step)).ceil / (1.0 / step)
  end
end
