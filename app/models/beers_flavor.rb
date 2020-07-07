class BeersFlavor < ApplicationRecord
    
    belongs_to :beer
    belongs_to :flavor

end
