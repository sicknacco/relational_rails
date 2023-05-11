# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Pie.destroy_all
Shop.destroy_all

@dub = Shop.create!(name: "DUB Pies", city: "Brooklyn", order_ahead: false, employee_count: 9)
@truck = Shop.create!(name: "Pie Truck", city: "Queens", order_ahead: false, employee_count: 2)
@flushing = Shop.create!(name: "Pfizer Building", city: "Brooklyn", order_ahead: true, employee_count: 4)

@mince = @dub.pies.create!(name: "Mince", category: "Meat", wholesale: false, bake_time: 35)
@mush = @dub.pies.create!(name: "Steak and Mushroom", category: "Meat", wholesale: false, bake_time: 20)
@curry = @dub.pies.create!(name: "Curry Veg", category: "Veggie", wholesale: false, bake_time: 20)

@sausage = @truck.pies.create!(name: "Sausage Roll", category: "Meat", wholesale: false, bake_time: 20)
@spin = @truck.pies.create!(name: "Spinach Roll", category: "Veggie", wholesale: false, bake_time: 20)
@chick = @truck.pies.create!(name: "Chicken Veg", category: "Meat", wholesale: false, bake_time: 40)
@apple = @truck.pies.create!(name: "Apple Pie", category: "Fruit", wholesale: false, bake_time: 60)


@m_c = @flushing.pies.create!(name: "Mince and Cheese", category: "Meat", wholesale: true, bake_time: 20)
@cherry = @flushing.pies.create!(name: "Cherry Pie", category: "Fruit", wholesale: true, bake_time: 60)
@steak = @flushing.pies.create!(name: "Steak and Ale", category: "Meat", wholesale: true, bake_time: 50)