# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Bookmark.destroy_all
Category.destroy_all
Recipe.destroy_all

require 'json'
require 'open-uri'

def recipe_builder(id)
  url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{id}"
  recipe_serialized = URI.open(url).read
  recipe = JSON.parse(recipe_serialized)

  meal = recipe["meals"].first

    # Create a Recipe with the fetched data
    Recipe.create(
      name: meal["strMeal"],
      description: meal["strInstructions"],
      image_url: meal["strMealThumb"],
      rating: rand(1..10)
    )
end

categories = ["Breakfast", "Pasta", "Seafood", "Dessert"]

categories.each do |category|
  url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category}"
  meals_serialized = URI.open(url).read
  meals = JSON.parse(meals_serialized)

  meals["meals"].each do |meal|
    p "Processing Recipe ID: #{meal["idMeal"]}"
    recipe_builder(meal["idMeal"])
  end
end

brazilian = Category.create(name: 'Brazillian')
italian = Category.create(name: 'Italian')
calorific = Category.create(name: 'Calorific')

feijoada = Recipe.create(
  name: 'Delicious Feijoada',
  description: "SUPER YummySUPER YummySUPER YummySUPER YummySUPER YummySUPER YummySUPER Yummy",
  image_url: "feijoada.jpg",
  rating: 9.5,
)

pasta = Recipe.create(
  name: 'Delicious Pasta',
  description: "Made by the MamaMade by the MamaMade by the MamaMade by the Mama",
  image_url: "pasta.jpg",
  rating: 8.5
)

pizza = Recipe.create(
  name: 'Spicy Pizza',
  description: "Perfect for Friday nightPerfect for Friday nightPerfect for Friday",
  image_url: "pizza.jpg",
  rating: 7.5
)

salad = Recipe.create(
  name: 'Fresh Salad',
  description: "Super yummy salaaaadSuper yummy salaaaadSuper yummy salaaaadSuper yummy",
  image_url: "salad.jpg",
  rating: 6.5
)

Bookmark.create(comment: "My favourite one", recipe: feijoada, category: brazilian)
Bookmark.create(comment: "Perfect for Friday night", recipe: pizza, category: calorific)
Bookmark.create(comment: "Too healthy", recipe: salad, category: italian)
