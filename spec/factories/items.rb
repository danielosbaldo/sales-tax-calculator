# frozen_string_literal: true

# spec/factories/items.rb
FactoryBot.define do
  factory :item do
    tax_calculator { TaxCalculator.new(0.10, 0.05) }
    quantity { 1 }

    trait :non_exempt_non_imported do
      name { 'music CD' }
      price { 14.99 }
      imported { false }
      tax_exempt { false }
    end

    trait :exempt_non_imported do
      name { 'book' }
      price { 12.49 }
      imported { false }
      tax_exempt { true }
    end

    trait :exempt_imported do
      name { 'imported box of chocolates' }
      price { 10.00 }
      imported { true }
      tax_exempt { true }
    end

    trait :non_exempt_imported do
      name { 'imported bottle of perfume' }
      price { 47.50 }
      imported { true }
      tax_exempt { false }
    end

    initialize_with do
      new(name: name, quantity: quantity, price: price, imported: imported, tax_exempt: tax_exempt,
          tax_calculator: tax_calculator)
    end
  end
end
