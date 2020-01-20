# Examples:
  # movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  # Character.create(name: 'Luke', movie: movies.first)

# brands = []
# 50.times do |i|
#   brands << Brand.new(name: "Brand-#{i+1}")
# end

# 100.times do |i|
#   Brand.create!(
#     name: "Brand #{i+1}",
#   )
# end

require "csv"

CSV.foreach('db/brand.csv') do |row|
  Brand.create(:name => row[0])
end

CSV.foreach('db/category.csv') do |row|
  Category.create(:name => row[0], :parent_id => row[1])
end