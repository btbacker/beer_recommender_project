class Beer < ApplicationRecord

    has_many :flights
    has_many :beers_flavors
    has_many :likes
    has_many :flavors, through: :beers_flavors
    has_many :orders, through: :flights
    has_many :users, through: :likes

    def all_beer_styles
        styles = Beer.all.map {|beer| beer.beer_style }.uniq
    end

end
