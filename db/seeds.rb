Product.destroy_all

50.times do |index|
  new_product = Product.create!(name: Faker::Superhero.unique.power,
                        price: Faker::Commerce.price,
                        country: Faker::Address.country)
  5.times do
    new_product.reviews.create!(author: Faker::Superhero.name, content: Faker::Lorem.characters(100), rating: Faker::Number.between(1, 5))
  end
end

p "Created #{Product.count} products"
p "Created #{Review.count} reviews"
