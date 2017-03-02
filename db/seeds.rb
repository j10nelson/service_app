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
trade: "hairdresser",
type_of_service: "Cut",
)

Service.create!(
trade: "massage Therapist",
type_of_service: "Deep Tissue",
)

Service.create!(
trade: "nail",
type_of_service: "Paint Nails",
)


Service.create!(
trade: "pool Cleaning",
type_of_service: "Clean Pool",
)

Service.create!(
trade: "Snow Removal",
type_of_service: "Clean Driveway",
)



  puts "#{Service.count} trades created"
