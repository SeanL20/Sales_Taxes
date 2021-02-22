# Sales_Taxes

Code Assessment For ReadyTech where it would calculate the sales taxes for products.

## The Problem

Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

When I purchase items, I receive a receipt that lists the name of all the items and their price (including tax), finishing with the total cost of the items, and the total amounts of sales taxes paid. The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

## Solution

I created 3 classes which are the **sales taxes**, **product listing** and **product** classes where: 
	- **sales taxes** would read the CSV file and create a **product listing** class and multiple **product** class depending on the CSV File as well as calculating the total price and tax amount.
	- **product listing** class would store an array of **product** classes and function for creating new **product** class and storing it in the **product listing**.
	- **product** class would be a class that stores the product name, quantity and price.

The data CSV files are stored in the data folder.

## Setup

1. Runs command ```bundle install```
2. Runs command ```ruby sales_taxes_function.rb [CSV_data_file_path]``` for the solution
3. Runs command ```rspec``` for testing
