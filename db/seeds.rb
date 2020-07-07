require './app/adapter/api_link.rb'

ApiLink.get_data("Beer")

# # "beers": "name", "country", "abv", "ibu"
# beer1 = Beer.create(name: "Westvleteren 12", country: "Belgium", abv: 10.2, ibu: 36)
# beer2 = Beer.create(name: "1500", country: "United States", abv: 5.5, ibu: 48)
# beer3 = Beer.create(name: "Weihenstephaner Vitus", country: "Germany", abv: 7.7, ibu: 17)

# # "flavor": "descriptor"
# flavor_1 = Flavor.create(descriptor: "hoppy")
# flavor_2 = Flavor.create(descriptor: "sour")
# flavor_3 = Flavor.create(descriptor: "full-bodied")

# # "users": "username", "password_digest", "location"
# user_1 = User.create(username: "iona", password_digest: "password", location: "Oakland")
# user_2 = User.create(username: "brandon", password_digest: "password", location: "Seattle")

# order1 = Order.create(user_id: 1)
# order2 = Order.create(user_id: 2)
# order3 = Order.create(user_id: 1)

# like1 = Like.create(beer_id: 1, user_id: 1)
# like2 = Like.create(beer_id: 1, user_id: 2)
# like3 = Like.create(beer_id: 2, user_id: 1)
# like4 = Like.create(beer_id: 3, user_id: 2)

# # "beer_flavors": "flavor_id", "beer_id"
# 5.times do
#     BeersFlavor.create(flavor_id: Flavor.all.sample.id, beer_id: Beer.all.sample.id)
# end

# # "flight": "beer_id", "order_id"
# 5.times do
#     Flight.create(order_id: Order.all.sample.id, beer_id: Beer.all.sample.id)
# end

puts "Seeds done!"