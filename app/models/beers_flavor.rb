class BeersFlavor < ApplicationRecord
    
    belongs_to :beer
    belongs_to :flavor

    def self.beers_flavors_data
         beers_flavors = {"IPA - American" => [1, 3, 25], "Wheat Beer - Witbier" => [2, 17, 13], "IPA - Session / India Session Ale" => [1, 4, 13], "IPA - English" => [1, 25, 3], "Lager - American" => [22, 19, 25], "Red Ale - American Amber / Red" => [20, 32, 29], "Pale Ale - American" => [4, 22, 17], "Wheat Beer - American Pale Wheat" => [2, 17, 13], "Shandy / Radler" => [3, 22, 13], "Belgian Blonde" => [28, 4, 25], "Belgian Tripel" => [1, 25, 28], "Golden Ale" => [25, 19, 22], "Belgian Strong Golden Ale" => [8, 1, 4], "Brown Ale - English" => [19, 20, 29], "Pumpkin / Yam Beer" => [27, 29, 4], "Red Ale - Irish" => [20, 32, 29], "Bock - Hell / Maibock / Lentebock" => [28, 29, 1], "Red Ale - Imperial / Double" => [1, 32, 20], "Strong Ale - American" => [28, 8, 20], "Scotch Ale / Wee Heavy" => [20, 32, 10], "IPA - Imperial / Double" => [14, 28, 1], "Belgian Quadrupel" => [10, 20, 32],"California Common" => [20, 1, 9], "Belgian Strong Dark Ale" => [28, 10, 8], "Winter Ale" => [10, 28, 29], "Pale Ale - Belgian" => [20, 25, 29], "Sour - Fruited Gose" => [3, 13, 26], "English Bitter" => [7, 19, 20], "Lager - American Amber / Red" => [9, 20, 25], "Brown Ale - American" => [10, 20, 29], "Fruit Beer" => [3, 17, 22], "Belgian Dubbel" => [20, 29, 28], "Stout - Imperial / Double Coffee" => [8, 15, 23], "Blonde Ale" => [9, 19, 20], "Lager - Dark" => [10, 20, 23], "Pale Ale - English" => [1, 19, 20], "Porter - American" => [10, 11, 23], "Lager - Pale" => [19, 25, 29], "Sour - Flanders Red Ale" => [3, 25, 26],"Altbier" => [7, 11, 20], "IPA - New England" => [3, 14, 17], "Lager - American Light" => [9, 11, 19], "Lager - Munich Dunkel" => [10, 20, 25], "Lager - Helles" => [20, 25, 29], "Wheat Beer - Other" => [3, 19, 2], "Lager - IPL (India Pale Lager)" => [9, 19, 1], "Märzen" => [9, 20, 29], "Pilsner - Czech" => [9, 19, 25], "Pilsner - Other" => [9, 19, 31], "Schwarzbier" => [10, 20, 23], "Lager - Euro Pale" => [9, 19, 25], "Lager - Euro Dark" => [9, 23, 25], "Kölsch" => [9, 11, 19], "Lager - Amber" => [9, 20, 25], "Lager - Vienna" => [1, 19, 20], "Lager - Dortmunder / Export" => [19, 20, 25], "Lager - Winter" => [10, 29, 32], "Lager - Japanese Rice" => [9, 11, 19], "Bock - Single / Traditional" => [19, 20, 25], "Pilsner - German" => [9, 19, 22]}
    end


    # Needs to be fixed to properly seed data
    def self.beers_flavors
        beer_styles = BeersFlavor.beers_flavors_data
        beer_styles.each do |beers_flavor|
            beers = Beer.all.select do |beer|
                this_beer = beer.beer_style == beers_flavor[0]
                this_beer.each {|beer| BeersFlavor.create(beer_id: this_beer.id, flavor_id: 22)}
            end    
        end
    end

end
