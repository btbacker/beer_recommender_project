class User < ApplicationRecord

    has_many :orders
    has_many :likes
    has_many :beers, through: :likes
    has_many :flights, through: :orders

    has_secure_password

end
    # def get_user_flight_beers
    #     @user = self
    #     beers = []
    #     @user.flights.each do |flight|
    #         beers << Beer.all.find(flight.beer_id)
    #     end
    #     beers
    # end

