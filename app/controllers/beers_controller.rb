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

        @first_flavor = Flavor.where('descriptor LIKE ?', "%#{@flavor_1}%")

        @first_flavor_beer_1 = @first_flavor[0].beers.sample
        # byebug
        redirect_to beer_path(@first_flavor_beer_1)

        # else
        #   @beer = Beer.all
        # end
    end

    def show
        index
        @flavor_1 = params[:flavor_1]
        byebug
        @first_flavor = Flavor.where('descriptor LIKE ?', "%#{@flavor_1}%")
        @first_flavor_beer_1 = @first_flavor[0].beers.sample

    end

    private

    def beer_params
        params.require(:beer).permit(:name, :flavor_1, :flavor_2, :flavor_3)
    end

end
