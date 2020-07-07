class Beer < ApplicationRecord

    has_many :flights
    has_many :beers_flavors
    has_many :likes
    has_many :flavors, through: :beers_flavors
    has_many :orders, through: :flights
    has_many :users, through: :likes

end
