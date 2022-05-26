# Books-stock-stats

Books-stock-stats is a gem that provides you of elementary functions
to manage a stock of books.


## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add books-stock-stats

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install books-stock-stats
    
## Usage

To use this gem you'll have to require it main file:
```ruby
require "books_stock_stats"
```
Once you've done this, the next step is to initialize an instance
of the class Reader from the CsvReader module:
```ruby
reader = CsvReader::Reader.new
```
You can start by generating a csv file with random lines with:
```ruby
#the parameter is an integer that indicates how many millions
#of lines the file will have
#default file_name is "books_stock.csv"

reader.csv_generator(1, file_name: "books_stock.csv")

#the file will held information this way:
#"Date","ISBN","Amount"
#"2008-04-12","978-1-9343561-0-4",39.45
```
Now it's time to parse the csv information into our class atribute
@books, wich is an array.
```ruby
reader.read_in_csv_data "books_stock.csv"
```
Every line in the csv file will be added to @books as a BookInStock
class object, wich has three atributes: Date, ISBN and Amount.
```ruby
reader.read_in_csv_data "books_stock.csv"
```
We can see what's inside @books now...
```ruby
puts reader.books[1]
-> Date: 1902-01-22, ISBN: 330-9-9031182-4-6, Amount: 21.85
```
Now it's time to use the methods that books-stock-stats provides
us with.
```ruby
#returns the total price of all the books in the stock
reader.total_value_in_stock

#returns a hash with all the different books in @books and it's quantity
reader.unique_books

#returns a book's info
reader.book_select("330-9-9031182-4-6")#parameter is the requested book ISBN
-> Book: 330-9-9031182-4-6
   Quantity: 1
   Release date: 1902-01-22
   Price: 21.85

#returns an array with the different prices found for the same book
reader.find_price_error(isbn)

#to set the price of a specific book
reader.set_price(isbn, price)

#adds a new book to @books (as a BookInStock class object)
reader.add_book(date, isbn, amount)

#deletes a book from @books
reader.delete_book(isbn)
```
Finally, to write the information of @books (wich suffered changes)
back into the csv file (o create a new one), we have to use...
```ruby
#default file_name is "books_stock.csv"
reader.to_csv(file_name: 'books_stock.csv')
```
## Contributing

Contributions are always welcome!

Bug reports and pull requests are welcome on GitHub at
https://github.com/CaneNicolas/books-stock-stats.