# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "beginning seed file"

Trade.destroy_all

Trade.create!(
name: "Hairdresser",
)

Trade.create!(
name: "Massage Therapist",
)

Trade.create!(
name: "Nails",
)

Trade.create!(
name: "Pool Cleaning",
)

Trade.create!(
name: "Snow Removal",
)

Trade.create!(
name: "House Cleaning",
)

Trade.create!(
name: "Heating",
)

Trade.create!(
name: "Air Conditioning",
)



  puts "#{Trade.count} trades created"
