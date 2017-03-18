# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "beginning seed file"

Service.destroy_all
# Trade.destroy_all

# Trade.create!(
# name: "hairdresser"
# )
Service.create!(
type_of_service: "Cut",
price: 20,
# trade_id: Trade.find_by(name: "hairdresser").id
)




  puts "#{Service.count} trades created"
