# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Recipe.destroy_all

brazilian = Category.create(name: 'Brazilin')
italian = Category.create(name: 'Italian')
naughty = Category.create(name: 'Naughty')

feijoada = Recipe.create(
  name: 'Delicious Feijoada',
  description: "SUPER YummySUPER YummySUPER YummySUPER YummySUPER YummySUPER YummySUPER Yummy",
  image_url: "https://cheapandcheerfulcooking.com/vegan-feijoada-brazilian-national-dish/",
  rating: 9.5
)

pasta = Recipe.create(
  name: 'Delicious Pasta',
  description: "Made by the MamaMade by the MamaMade by the MamaMade by the Mama",
  image_url: "https://cheapandcheerfulcooking.com/vegan-feijoada-brazilian-national-dish/",
  rating: 8.5
)

pizza = Recipe.create(
  name: 'Spicy Pizza',
  description: "Perfect for Friday nightPerfect for Friday nightPerfect for Friday",
  image_url: "https://cheapandcheerfulcooking.com/vegan-feijoada-brazilian-national-dish/",
  rating: 7.5
)

salad = Recipe.create(
  name: 'Fresh Salad',
  description: "Super yummy salaaaadSuper yummy salaaaadSuper yummy salaaaadSuper yummy",
  image_url: "https://cheapandcheerfulcooking.com/vegan-feijoada-brazilian-national-dish/",
  rating: 6.5
)

puts "data created!"
