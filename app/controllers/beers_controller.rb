class BeersController < ApplicationController

    def index

        if params[:flavor_1]
            @flavor_1 = params[:flavor_1]
        end

        if params[:flavor_2]
            @flavor_2 = params[:flavor_2]
        end

        if params[:flavor_3]
            @flavor_3 = params[:flavor_3]
        end

        # MOVE TO MODEL

        @first_flavor = Flavor.where('descriptor LIKE ?', "%#{@flavor_1}%")
        @first_flavor_beer_1 = @first_flavor[0].beers.sample
        Flight.create(beer_id: @first_flavor_beer_1.id, order_id: 1)
        @first_flavor_beer_2 = @first_flavor[0].beers.sample
        Flight.create(beer_id: @first_flavor_beer_2.id, order_id: 1)

        @second_flavor = Flavor.where('descriptor LIKE ?', "%#{@flavor_2}%")
        @second_flavor_beer_1 = @second_flavor[0].beers.sample
        Flight.create(beer_id: @second_flavor_beer_1.id, order_id: 1)
        @second_flavor_beer_2 = @second_flavor[0].beers.sample
        Flight.create(beer_id: @second_flavor_beer_2.id, order_id: 1)

        @third_flavor = Flavor.where('descriptor LIKE ?', "%#{@flavor_3}%")
        @third_flavor_beer_1 = @third_flavor[0].beers.sample
        Flight.create(beer_id: @third_flavor_beer_1.id, order_id: 1)
        @third_flavor_beer_2 = @third_flavor[0].beers.sample
        Flight.create(beer_id: @third_flavor_beer_2.id, order_id: 1)

        render :index

    end

    def show
    end

    private

    def beer_params
        params.require(:beer).permit(:name, :flavor_1, :flavor_2, :flavor_3)
    end

end
