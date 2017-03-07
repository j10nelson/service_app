# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "beginning seed file"

Service.destroy_all

Service.create!(
type_of_service: "Cut",
price: 20
)

Service.create!(
type_of_service: "Deep Tissue",
price: 80
)

Service.create!(
type_of_service: "Paint Nails",
price: 40
)


Service.create!(
type_of_service: "Clean Pool",
price: 100
)

Service.create!(
type_of_service: "Clean Driveway",
price: 90
)



  puts "#{Service.count} trades created"
