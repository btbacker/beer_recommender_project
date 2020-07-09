class BeersController < ApplicationController

    before_action :current_user
    before_action :redirect_user

    def show
        @beer = Beer.find(params[:id])
        @like_status = @beer.likes.any? do |like|
            if like.user_id == current_user.id
                @like = like.id
            end
        end
    end
    
    def index

        if params["beer"]["flavor_ids"]
            # flavor.sample = params["beer"]["flavor_ids"][1]
           flavors =  params["beer"]["flavor_ids"].map {|flavor| flavor}
        #    byebug
        end

        @beers = []
        6.times do 
            @beers << Beer.find_beers(flavors.sample)
        end

        # byebug

        # @first_flavor_beer_1 = Beer.find_beers(flavors.sample)
        # @first_flavor_beer_2 = Beer.find_beers(flavors.sample)
        # @second_flavor_beer_1 = Beer.find_beers(flavors.sample)
        # @second_flavor_beer_2 = Beer.find_beers(flavors.sample)
        # @third_flavor_beer_1 = Beer.find_beers(flavors.sample)
        # @third_flavor_beer_2 = Beer.find_beers(flavors.sample)

        # if params[:flavor_2]
        #     @flavor_2 = params[:flavor_2]
        # end

        # if params[:flavor_3]
        #     @flavor_3 = params[:flavor_3]
        # end

        # byebug

        render :index

    end

    private

    def beer_params
        params.require(:beer).permit(flavor_ids:[])#, :flavor_1, :flavor_2, :flavor_3)
    end

end
