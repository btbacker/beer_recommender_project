class Flavor < ApplicationRecord

    has_many :beers_flavors
    has_many :beers, through: :beers_flavors

    def randomise_beers 
    end

    def new
    end

    def self.create_all
        all_flavors = ["Acai", "Acetaldehyde", "Acetic", "Acidic", "Alcoholic", "Alkaline", "Almond", "Amaretto", "Apple", "Apricot", "Aromatic", "Ash", "Astringent", "Autolysed", "Autumnal", "Bakelite", "Balanced", "Banana", "Barrel-Aged", "Beany", "Belgiany", "Berries", "Biscuity", "Bitter", "Black Currant", "Blackberry", "Blood Orange", "Blueberry", "Body", "Boozy", "Bourbon", "Boysenberry", "Brandy", "Bread", "Brett", "Bright", "Brilliant", "Brown Sugar", "Bubblegum", "Bubbly", "Buckwheat", "Burnt", "Butterfinger", "Butterscotch", "Buttery", "Butyric", "Cake", "Can-liner", "Candy", "Caprylic", "Caramel", "Caramelly", "Carbolic", "Carbonated", "Cardamom", "Carrot", "Catty", "Cereal", "Chai", "Characterless", "Charred", "Cheesy", "Cherry", "Chestnuts", "Chewy", "Chili", "Chipotle", "Chlorophenol", "Chocolate", "Cinnamon", "Citrus", "Citrusy", "Clean", "Clementine", "Cloudberry", "Cloudy", "Clove", "Cocoa", "Coconut", "Coffee", "Coffeeish", "Cookie", "Coriander", "Corn", "Corn Grits", "Cranberry", "Creamy", "Crisp", "Crushable", "Cucumber", "Cumin", "Dank", "Dark", "Dates", "Deep", "Delicate", "Diacetyl", "Dry", "Dry-hop", "Drying", "Earthy", "Effervescent", "Elderflower", "Elegant", "Esters", "Estery", "Fatty", "Fig", "Flat", "Floral", "Fluffy", "Fragrant", "Fruity", "Full", "Fullness", "Funky", "Garlic", "Gassy", "Gentle", "Geraniol", "Ginger", "Graham Cracker", "Grainy", "Grapefruit Peel" ]
        all_flavors.each do |flavor|
            Flavor.create(descriptor: flavor)
        end
    end

    def self.create_essential
        essential_flavors = []
    end
end
