class BeersFlavor < ApplicationRecord
    
    belongs_to :beer
    belongs_to :flavor

    def self.beers_flavors_data
         beers_flavors = {"IPA - American" => ["Hoppy", "Fruity", "Smooth"], "Wheat Beer - Witbier" => ["Wheat", "Juicy", "Funky"], "IPA - Session / India Session Ale" => ["Hoppy", "Aromatic", "Funky"], "IPA - English" => ["Hoppy", "Smooth", "Fruity"], "Lager - American" => ["Refreshing", "Light", "Smooth"], "Red Ale - American Amber / Red" => ["Malty", "Toffee", "Sweet"], "Pale Ale - American" => ["Aromatic", "Refreshing", "Juicy"], "Wheat Beer - American Pale Wheat" => ["Wheat", "Juicy", "Funky"], "Shandy / Radler" => ["Fruity", "Refreshing", "Funky"], "Belgian Blonde" => ["Strong", "Aromatic", "Smooth"], "Belgian Tripel" => ["Hoppy", "Smooth", "Strong"], "Golden Ale" => ["Smooth", "Light", "Refreshing"], "Belgian Strong Golden Ale" => ["Boozy", "Hoppy", "Aromatic"], "Brown Ale - English" => ["Light", "Malty", "Sweet"], "Pumpkin / Yam Beer" => ["Sweet", "Sweet", "Aromatic"], "Red Ale - Irish" => ["Malty", "Toffee", "Sweet"], "Bock - Hell / Maibock / Lentebock" => ["Strong", "Sweet", "Hoppy"], "Red Ale - Imperial / Double" => ["Hoppy", "Toffee", "Malty"], "Strong Ale - American" => ["Strong", "Boozy", "Malty"], "Scotch Ale / Wee Heavy" => ["Malty", "Toffee", "Dark"], "IPA - Imperial / Double" => ["Hazy", "Strong", "Hoppy"], "Belgian Quadrupel" => ["Dark", "Malty", "Toffee"],"California Common" => ["Malty", "Hoppy", "Clean"], "Belgian Strong Dark Ale" => ["Strong", "Dark", "Boozy"], "Winter Ale" => ["Dark", "Strong", "Sweet"], "Pale Ale - Belgian" => ["Malty", "Smooth", "Sweet"], "Sour - Fruited Gose" => ["Fruity", "Funky", "Sour"], "English Bitter" => ["Bitter", "Light", "Malty"], "Lager - American Amber / Red" => ["Clean", "Malty", "Smooth"], "Brown Ale - American" => ["Dark", "Malty", "Sweet"], "Fruit Beer" => ["Fruity", "Juicy", "Refreshing"], "Belgian Dubbel" => ["Malty", "Sweet", "Strong"], "Stout - Imperial / Double Coffee" => ["Boozy", "Heavy", "Roasty"], "Blonde Ale" => ["Clean", "Light", "Malty"], "Lager - Dark" => ["Dark", "Malty", "Roasty"], "Pale Ale - English" => ["Hoppy", "Light", "Malty"], "Porter - American" => ["Dark", "Dry", "Roasty"], "Lager - Pale" => ["Light", "Smooth", "Sweet"], "Sour - Flanders Red Ale" => ["Fruity", "Smooth", "Sour"],"Altbier" => ["Bitter", "Dry", "Malty"], "IPA - New England" => ["Fruity", "Hazy", "Juicy"], "Lager - American Light" => ["Clean", "Dry", "Light"], "Lager - Munich Dunkel" => ["Dark", "Malty", "Smooth"], "Lager - Helles" => ["Malty", "Smooth", "Sweet"], "Wheat Beer - Other" => ["Fruity", "Light", "Wheat"], "Lager - IPL (India Pale Lager)" => ["Clean", "Light", "Hoppy"], "Märzen" => ["Clean", "Malty", "Sweet"], "Pilsner - Czech" => ["Clean", "Light", "Smooth"], "Pilsner - Other" => ["Clean", "Light", "Thin"], "Schwarzbier" => ["Dark", "Malty", "Roasty"], "Lager - Euro Pale" => ["Clean", "Light", "Smooth"], "Lager - Euro Dark" => ["Clean", "Roasty", "Smooth"], "Kölsch" => ["Clean", "Dry", "Light"], "Lager - Amber" => ["Clean", "Malty", "Smooth"], "Lager - Vienna" => ["Hoppy", "Light", "Malty"], "Lager - Dortmunder / Export" => ["Light", "Malty", "Smooth"], "Lager - Winter" => ["Dark", "Sweet", "Toffee"], "Lager - Japanese Rice" => ["Clean", "Dry", "Light"], "Bock - Single / Traditional" => ["Light", "Malty", "Smooth"], "Pilsner - German" => ["Clean", "Light", "Refreshing"]}
    end

    # Needs to be fixed to properly seed data
    def self.beers_flavors
        beer_styles = BeersFlavor.beers_flavors_data
        beer_styles.each do |beers_flavor|
            beers = Beer.all.select { |beer| beer.beer_style == beers_flavor[0] }
            beers.each do |beer|
                BeersFlavor.create(beer_id: beer.id, flavor_id: BeersFlavor.find_flavor(beers_flavor[1][0]))
                BeersFlavor.create(beer_id: beer.id, flavor_id: BeersFlavor.find_flavor(beers_flavor[1][1]))
                BeersFlavor.create(beer_id: beer.id, flavor_id: BeersFlavor.find_flavor(beers_flavor[1][2]))
            end
        end
    end

    def self.find_flavor(flavor)
        flavor = Flavor.where(descriptor: flavor)
        flavor[0].id
    end

    def self.dedupe
        grouped = all.group_by{|beers_flavor| [beers_flavor.beer_id, beers_flavor.flavor_id] }
        grouped.values.each do |duplicates|
          first_one = duplicates.shift
          duplicates.each{|double| double.destroy}
        end
    end

end