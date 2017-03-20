# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "beginning seed file"

# Service.destroy_all
Trade.destroy_all

Trade.create!(
name: "hairdresser"
)

Trade.create!(
name: "masseuse"
)

Trade.create!(
name: "trainer"
)

Trade.create!(
name: "beauty"
)

Trade.create!(
name: "manicurist"
)

Trade.create!(
name: "automotive"
)

Trade.create!(
name: "dog care"
)

Trade.create!(
name: "home chef"
)

Trade.create!(
name: "babysitting"
)

Trade.create!(
name: "pest control "
)

Trade.create!(
name: "groceries"
)

Trade.create!(
name: "seasonal"
)





# Service.create!(
# type_of_service: "Cut",
# price: 20,
# trade_id: Trade.find_by(name: "hairdresser").id
# )




  puts "#{Trade.count} trades created"
