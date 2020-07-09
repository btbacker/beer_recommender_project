class Order < ApplicationRecord

    has_many :flights
    has_many :beers, through: :flights
    belongs_to :user

end