require "csv"

CSV.foreach('db/brand.csv') do |row|
  Brand.create(:name => row[0])
end