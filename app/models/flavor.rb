class Flavor < ApplicationRecord

    has_many :beers_flavors
    has_many :beers, through: :beers_flavors

    def randomise_beers 
    end

    def new
    end

    def self.create_essential
        essential_flavors = ["Aromatic", "Banana", "Barrel aged", "Bitter", "Boozy", "Clean", "Dark", "Dry", "Fruity", "Funky", "Hazy", "Heavy", "Hoppy", "Juicy", "Lactose", "Light", "Malty", "Piney", "Refreshing", "Roasty", "Smoky", "Smooth", "Sour", "Spiced", "Strong", "Sweet", "Thick", "Thin", "Toffee", "Wheat"]
        essential_flavors.each do |flavor|
            Flavor.create(descriptor: flavor)
        end
    end

    def self.dedupe
        grouped = all.group_by{|flavor| [flavor.descriptor] }
        grouped.values.each do |duplicates|
          first_one = duplicates.shift
          duplicates.each{|double| double.destroy}
        end
    end
end
