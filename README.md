# Sales Tax Calculator

The Sales Tax Calculator is a Ruby command-line application that calculates sales tax for a list of items based on their prices, import status, and tax exemptions. The application prints out the receipt details for a given list of items, including their prices (including tax), total cost, and total sales taxes paid.

## Requirements

- Ruby 2.7 or higher

## Installation

1. Clone the repository:

```
git clone https://github.com/danielosbaldo/sales-tax-calculator.git
```


2. Change into the project directory:
```
cd sales-tax-calculator
```

3. Install the required gems:
```
bundle install
```
## Usage

1. Run the application with the following command:
```
ruby main.rb
```

2. Enter the items one at a time, following the format: `<quantity> [imported] <item name> at <price>`. For example:
```
1 book at 12.49
```
or
```
1 imported box of chocolates at 10.00
```
3. Remember to type 'done' and press Enter when you have finished entering items. The application will then calculate the sales tax, generate a receipt, and display it in the terminal.

## Sample Input and Output

Input:
```
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
done
```

Output:
```
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32
```

## Running Tests

The project includes RSpec tests to ensure the correct calculation of sales tax. To run the tests, execute the following command in the project directory:
```
bundle exec rspec
```

This will run all the tests located in the `spec` directory.
