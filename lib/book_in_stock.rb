class BookInStock
    attr_reader :date, :isbn
    attr_accessor :amount

    def initialize (date, isbn, amount)
        @date = date
        @isbn = isbn
        @amount = amount.to_f
    end

    def to_s
        "Date: #{@date}, ISBN: #{@isbn}, Amount: #{@amount}"
    end
end