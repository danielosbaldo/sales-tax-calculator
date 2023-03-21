# frozen_string_literal: true

# spec/receipt_spec.rb
require_relative '../receipt'

describe Receipt do
  describe '#add_item' do
    it 'adds an item to the receipt' do
      receipt = Receipt.new
      receipt.add_item('1 book at 12.49')
      expect(receipt.instance_variable_get(:@items).length).to eq(1)
    end
  end

  describe '#print' do
    it 'prints receipt correctly for input1' do
      input = "2 book at 12.49\n1 music CD at 14.99\n1 chocolate bar at 0.85\n"
      receipt = Receipt.new
      input.each_line { |line| receipt.add_item(line.strip) }

      output = <<~OUTPUT
        2 book: 24.98
        1 music CD: 16.49
        1 chocolate bar: 0.85
        Sales Taxes: 1.50
        Total: 42.32
      OUTPUT

      expect { receipt.print }.to output(output).to_stdout
    end
  end
end
