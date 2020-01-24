require "csv"

CSV.foreach('../csv_files/brand.csv') do |row|
  Brand.create(:name => row[0])
end