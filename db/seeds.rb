# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'Destroying all records...'
Recipe.destroy_all

puts 'Creating users...'
user1 = User.create(email: "lolo@gmail.com", password: "123456")
user2 = User.create(email: "clara@gmail.com", password: "123456")
user3 = User.create(email: "simone@gmail.com", password: "123456")

puts 'Creating recipes...'

Recipe.create!([
  {
    title: "Spaghetti Carbonara",
    description: "A classic Italian pasta dish with creamy sauce.",
    image: "https://example.com/images/carbonara.jpg",
    cooking_time: "30 minutes",
    ingredients: ["spaghetti", "eggs", "parmesan cheese", "bacon", "black pepper"],
    instruction: "Cook pasta. Mix eggs and cheese. Cook bacon. Combine all ingredients and serve."
  },
  {
    title: "Chicken Curry",
    description: "A flavorful and spicy chicken curry.",
    image: "https://example.com/images/chicken_curry.jpg",
    cooking_time: "45 minutes",
    ingredients: ["chicken", "onions", "tomatoes", "curry powder", "coconut milk"],
    instruction: "Cook onions and tomatoes. Add chicken and curry powder. Pour coconut milk and simmer."
  },
  {
    title: "Vegetable Stir Fry",
    description: "A quick and healthy stir-fried vegetable dish.",
    image: "https://example.com/images/vegetable_stir_fry.jpg",
    cooking_time: "20 minutes",
    ingredients: ["broccoli", "carrots", "bell peppers", "soy sauce", "ginger"],
    instruction: "Stir fry vegetables in a hot pan with soy sauce and ginger."
  },
  {
    title: "Beef Tacos",
    description: "Delicious beef tacos with fresh toppings.",
    image: "https://example.com/images/beef_tacos.jpg",
    cooking_time: "25 minutes",
    ingredients: ["ground beef", "taco shells", "lettuce", "cheese", "salsa"],
    instruction: "Cook beef. Fill taco shells with beef and toppings. Serve."
  },
  {
    title: "Margherita Pizza",
    description: "A simple and classic pizza with fresh ingredients.",
    image: "https://example.com/images/margherita_pizza.jpg",
    cooking_time: "1 hour",
    ingredients: ["pizza dough", "tomato sauce", "mozzarella", "basil"],
    instruction: "Spread sauce on dough. Add cheese and basil. Bake until golden."
  },
  {
    title: "Caesar Salad",
    description: "A fresh and crunchy Caesar salad.",
    image: "https://example.com/images/caesar_salad.jpg",
    cooking_time: "15 minutes",
    ingredients: ["romaine lettuce", "croutons", "parmesan cheese", "Caesar dressing"],
    instruction: "Toss lettuce with dressing. Add croutons and cheese. Serve."
  },
  {
    title: "Pancakes",
    description: "Fluffy and golden pancakes perfect for breakfast.",
    image: "https://example.com/images/pancakes.jpg",
    cooking_time: "20 minutes",
    ingredients: ["flour", "milk", "eggs", "butter", "syrup"],
    instruction: "Mix ingredients. Cook on a griddle until golden. Serve with syrup."
  },
  {
    title: "Grilled Salmon",
    description: "Perfectly grilled salmon with a hint of lemon.",
    image: "https://example.com/images/grilled_salmon.jpg",
    cooking_time: "25 minutes",
    ingredients: ["salmon", "lemon", "olive oil", "garlic", "herbs"],
    instruction: "Marinate salmon. Grill until cooked. Serve with lemon."
  },
  {
    title: "Chocolate Cake",
    description: "Rich and moist chocolate cake for dessert.",
    image: "https://example.com/images/chocolate_cake.jpg",
    cooking_time: "1 hour",
    ingredients: ["flour", "cocoa powder", "sugar", "eggs", "butter"],
    instruction: "Mix ingredients. Bake in oven. Let cool and serve."
  },
  {
    title: "Tomato Soup",
    description: "A warm and comforting tomato soup.",
    image: "https://example.com/images/tomato_soup.jpg",
    cooking_time: "30 minutes",
    ingredients: ["tomatoes", "onions", "garlic", "vegetable broth", "cream"],
    instruction: "Cook tomatoes and onions. Blend with broth. Add cream and serve."
  }
])

puts "Created #{Recipe.count} recipes!"
