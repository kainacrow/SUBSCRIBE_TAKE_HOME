## Sales Tax Calculator
This Ruby application calculates the total sales tax and total price for items in a shopping basket, following specific tax rules:
- Basic sales tax of 10% applies to all goods, except books, food, and medical products.
- Import duty of 5% applies to all imported goods with no exemptions.
- Sales tax is rounded up to the nearest 0.05.

### Features
- Calculate sales tax for individual items, including exemptions and import duties.
- Calculate the total sales tax and total price for a shopping basket of multiple items.
- Easily test and customize the tax rules.

### Prerequisites
- Ruby (>= 3.0.0)
- Bundler (optional but recommended for managing dependencies)

### Setup
1. Clone the Repository:
```
git clone
cd SUBSCRIBE_TAKE_HOME
```
2. Install Dependencies (optional):
```
bundle install
```

### Files
1. `item.rb`

    Defines the `Item` class, which represents an individual item in the basket. It handles properties like quantity, name, price, and calculates sales tax based on its attributes (e.g., whether it's imported or exempt from basic tax).

2. `basket.rb`

    Defines the `Basket` class, which manages multiple `Item` instances. It provides methods to:
   - Add items to the basket.
   - Calculate total sales tax and total price for all items in the basket.
   - Print a formatted receipt that lists each item with its quantity, name, price (including tax), and totals.

3. `purchase.rb`

    Defines the `Purchase` class, which includes the `purchase_basket` method. This method takes an array of input lines, parses each line into `Item` objects, adds them to a `Basket`, and then prints the receipt. This class can be used independently for processing a predefined list of items.

4. `io_purchase.rb`
   
    Defines the `IOPurchase` class, which provides an interactive experience for users. It includes:
   - `interactive_purchase`: Prompts the user to enter items line by line in the format `quantity item_name at price_per_item`. Users can type `done` to finish input. This method uses Purchase to process the items and print a receipt.
   - `valid_input_format?`: A helper method to validate each input line format, ensuring it matches the expected structure (`quantity item_name at price_per_item`)

5. `sample_purchase.rb`

    Defines the `sample_purchase` method, which contains predefined sample data sets. It uses `Purchase` to process each sample basket and prints receipts for each. This file allows the application to run with hard-coded test data and verify expected outputs without user interaction.

6. `main.rb`

   The entry point of the application. It prompts the user to choose between an interactive purchase or running the sample file:

   - **Interactive Purchase**: If chosen, IOPurchase is used to prompt the user for manual item entry and print the receipt. 
   - **Sample File**: If chosen, sample_purchase runs predefined sample data and outputs receipts for each data set.


### Usage
#### Running the Application
To run the application, execute main.rb:
```
ruby main.rb
```
The application will prompt:
```
Would you like to make an interactive purchase or run the sample file? (type 'interactive' or 'sample')
Purchase Type:
```
- **Interactive**: Follow the prompts to manually enter items in the format quantity item_name at price.
- **Sample**: The application will run the predefined test data.

### Example Usage
#### Interactive Purchase
```
Would you like to make an interactive purchase or run the sample file? (type 'interactive' or 'sample')
interactive
Enter each item in the format 'quantity item_name at price'. Type 'done' when finished.
Item: 1 book at 12.49
Item: 1 music CD at 14.99
Item: done

Receipt:
1 book: 12.49
1 music CD: 16.49
Sales Taxes: 1.50
Total: 28.98
```
#### Sample Purchase
```
Would you like to make an interactive purchase or run the sample file? (type 'interactive' or 'sample')
sample

Output 1:
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32

Output 2:
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15

Output 3:
1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported boxes of chocolates: 35.55
Sales Taxes: 7.90
Total: 98.38
```

### Project Structure
```
SUBSCRIBE_TAKE_HOME/
├── item.rb             # Defines the Item class for individual item calculations
├── basket.rb           # Defines the Basket class for handling multiple items
├── purchase.rb         # Defines the Purchase class for processing baskets
├── io_purchase.rb      # Defines the IOPurchase class for interactive input
├── sample_purchase.rb  # Defines the sample_purchase method with predefined data
├── main.rb             # Entry point that runs the program based on user choice
├── spec/
│   ├── item_spec.rb    # RSpec tests for the Item class
│   ├── basket_spec.rb  # RSpec tests for the Basket class
│   ├── purchase_spec.rb  # RSpec tests for the Purchase class
│   ├── purchase_io_spec.rb  # RSpec tests for the PurchaseIO class
│   ├── main_spec.rb  # RSpec tests for the main file
│   └── item_helper.rb  # Test helper methods (DRY methods)
├── Gemfile             # Project dependencies
└── README.md           # Project documentation
```

### Testing
The application includes tests using RSpec. To run the tests:

1. Initialize RSpec
```
rspec --init
```
2. Run Tests
```
rspec
```
To run a specific file or test case you may include the file and line number.
```
rspec spec/item_spec.rb:19
```
