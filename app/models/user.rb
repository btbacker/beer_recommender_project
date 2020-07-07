class User < ApplicationRecord

    has_many :orders
    has_many :likes
    has_many :beers, through: :likes
    has_many :flights, through: :orders

end
