# frozen_string_literal: true

# spec/item_spec.rb
require_relative '../item'
require_relative '../tax_calculator'
require 'factory_bot'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot.find_definitions

describe Item do
  describe '#sales_tax' do
    it 'calculates sales tax correctly for a non-exempt, non-imported item' do
      item = build(:item, :non_exempt_non_imported)
      expect(item.sales_tax).to eq(1.5)
    end

    it 'calculates sales tax correctly for an exempt, non-imported item' do
      item = build(:item, :exempt_non_imported)
      expect(item.sales_tax).to eq(0)
    end

    it 'calculates sales tax correctly for an exempt, imported item' do
      item = build(:item, :exempt_imported)
      expect(item.sales_tax).to eq(0.5)
    end

    it 'calculates sales tax correctly for a non-exempt, imported item' do
      item = build(:item, :non_exempt_imported)
      expect(item.sales_tax).to eq(7.15)
    end
  end
end
