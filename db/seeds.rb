# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Shop.destroy_all

@dub = Shop.create!(name: "DUB Pies", city: "Brooklyn", order_ahead: false, employee_count: 9)
@truck = Shop.create!(name: "Pie Truck", city: "Queens", order_ahead: false, employee_count: 2)
@flushing = Shop.create!(name: "Pfizer Building", city: "Brooklyn", order_ahead: true, employee_count: 4)