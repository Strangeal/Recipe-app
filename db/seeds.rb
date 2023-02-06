# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


user_1 = User.create(name: "Tom")
user_2 = User.create(name: "Dianne")
user_3 = User.create(name: "Agnes")
user_4 = User.create(name: "Dorcas")
user_5 = User.create(name: "Whitney")
user_6 = User.create(name: "Lillian")

food_1 = Food.create(name: "Apple", measurement_unit: "5kg", price: 1.99, quantity: 3, user: user_1)
food_2 = Food.create(name: "Pizza", measurement_unit: "5kg", price: 75, quantity: 1, user: user_1)
food_3 = Food.create(name: "Orange", measurement_unit: "5kg", price: 0.5, quantity: 9, user: user_2)
food_4 = Food.create(name: "Cup cake", measurement_unit: "5kg", price: 2.99, quantity: 11, user: user_3)
food_5 = Food.create(name: "Yam", measurement_unit: "5kg", price: 10, quantity: 2, user: user_3)


recipe_1 = Recipe.create(name: "Jollof recipe", preparation_time: "12:05", cooking_time: "6:45", description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem doloribus, a quam harum aliquid amet molestiae deserunt laborum, delectus voluptas illo rem inventore nihil sit consequatur iure vitae ratione reiciendis.Consectetur, commodi! Repudiandae neque, soluta debitis rerum necessitatibus, sunt, reprehenderit hic quia magni nemo sequi illum! Nemo beatae deleniti", user: user_1)
recipe_2 = Recipe.create(name: "Banku recipe", preparation_time: "12:05", cooking_time: "6:45", description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem doloribus, a quam harum aliquid amet molestiae deserunt laborum, delectus voluptas illo rem inventore nihil sit consequatur iure vitae ratione reiciendis.Consectetur, commodi! Repudiandae neque, soluta debitis rerum necessitatibus, sunt, reprehenderit hic quia magni nemo sequi illum! Nemo beatae deleniti", user: user_2)
recipe_3 = Recipe.create(name: "Pizza recipe", preparation_time: "12:05", cooking_time: "6:45", description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem doloribus, a quam harum aliquid amet molestiae deserunt laborum, delectus voluptas illo rem inventore nihil sit consequatur iure vitae ratione reiciendis.Consectetur, commodi! Repudiandae neque, soluta debitis rerum necessitatibus, sunt, reprehenderit hic quia magni nemo sequi illum! Nemo beatae deleniti", user: user_3)

entry_1 = RecipeFood.create(quantity: 12, recipe: recipe_1, food: food_1)
entry_2 = RecipeFood.create(quantity: 2, recipe: recipe_2, food: food_2)
entry_3 = RecipeFood.create(quantity: 19, recipe: recipe_1, food: food_1)
entry_4 = RecipeFood.create(quantity: 42, recipe: recipe_2, food: food_2)