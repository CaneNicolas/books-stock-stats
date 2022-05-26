require 'csv'
require_relative 'book_in_stock'
require_relative 'csv_generator'

module CsvReader
    class Reader
        include CsvGenerator
 
        attr_accessor :books
 
        def initialize
            @books = Array.new
        end
     
        def read_in_csv_data(csv_file_name)
            CSV.foreach(csv_file_name, headers: true) do |row|
                @books << BookInStock.new(
                    row["Date"],
                    row["ISBN"],
                    row["Amount"]
                )
            end
        end

        def to_csv(file_name: 'books_stock.csv')
            enum = @books.to_enum
            headers = %w[Date ISBN Amount]
            CSV.open(file_name, 'w+', write_headers: true, headers: headers) do |row|
                enum.each { |book| row << ["#{book.date}", "#{book.isbn}", "#{book.amount}"] }
            end
        end
         
        def total_value_in_stock
            enum = @books.to_enum
            sum = 0
            loop do
                sum += enum.next.amount
            end
            return sum.round(2)
        end  
         
        def unique_books
            enum = @books.to_enum
            uniques = Hash.new { |key, value| key[value] = 0 }
            loop do
                uniques[enum.next.isbn] += 1
            end
            return uniques
        end
     
        def book_select (isbn)
            enum = @books.to_enum
            qty = 0
            date = ''
            price = ''
            enum.each do |book|
                if book.isbn == isbn
                    qty += 1
                    price = book.amount
                    date = book.date
                end
            end
            return "Book: #{isbn}\nQuantity: #{qty}\nRelease date: #{date}\nPrice: #{price}"
        end
         
        def find_price_error(isbn)
            enum = @books.to_enum
            prices = Array.new
            enum.each do |book|
                if book.isbn == isbn
                     prices.append  book.amount
                end
            end
            return "Precios encontrados para el mismo libro: #{prices}"
        end
     
        def set_price(isbn, price)
            enum = @books.to_enum
            enum.each do |book|
                if book.isbn == isbn
                    book.amount = price
                end
            end
            return "Nuevo precio establecido correctamente!"
        end
     
        def add_book(date, isbn, amount)
            @books << BookInStock.new("#{date}","#{isbn}",amount)
        end
        
        def delete_book(isbn)
            enum = @books.to_enum
            n = 0
            enum.each do |book|
                if book.isbn == isbn
                    @books.delete_at n
                end
                n =+ 1
            end
            return "El libro se sacó del stock correctamente!"
        end
    end
end