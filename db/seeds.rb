require './app/adapter/api_link.rb'

# Beer.destroy_all 
# Flavor.destroy_all 
# BeersFlavor.destroy_all 

ApiLink.get_data("Beer")

puts "Seeds done!"