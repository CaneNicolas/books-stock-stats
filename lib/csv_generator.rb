require 'csv'

module CsvGenerator
    def generate_row
        date_list = ['01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31']
        date = "#{rand(1800..2022)}-#{date_list[0..11].sample}-#{date_list.sample}"
        isbn = "#{rand(100..999)}-#{rand(10)}-#{rand(1_000_000..9_999_999)}-#{rand(10)}-#{rand(10)}"
        amount = "#{rand(10...100)}.#{rand(10...100)}"
        row = [date, isbn, amount]
        return row
    end
    
    def csv_generator(n, file_name: 'books_stock.csv')
        headers = %w[Date ISBN Amount]
        enum = Enumerator.new do |y|
            loop do
                y << generate_row
            end
        end
        
        CSV.open(file_name, 'w+', write_headers: true, headers: headers) do |row|
            (n * 1_000_000).times { row << enum.next }
        end
    end
end