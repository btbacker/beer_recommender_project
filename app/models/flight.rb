class Flight < ApplicationRecord

    has_many :beers
    belongs_to :order
    has many :beers_flavors, through: :beers

end
