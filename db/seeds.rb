Product.destroy_all

50.times do |index|
  Product.create!(name: Faker::Superhero.unique.power,
                        price: Faker::Commerce.price,
                        country: Faker::Address.country)
end

p "Created #{Product.count} products"
