require "csv"

CSV.foreach('Rails.root.join('db', 'seeds', 'csv_files', 'brand.csv')') do |row|
  Brand.create(:name => row[0])
end