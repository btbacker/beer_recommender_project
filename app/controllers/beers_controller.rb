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

        if params[:flavor_1]
            @flavor_1 = params[:flavor_1]
        else
            flash[:message] = @flavor_1.errors.full_messages
        end

        if params[:flavor_2]
            @flavor_2 = params[:flavor_2]
        end

        if params[:flavor_3]
            @flavor_3 = params[:flavor_3]
        end

        @first_flavor_beer_1 = Beer.find_beers(@flavor_1)
        @first_flavor_beer_2 = Beer.find_beers(@flavor_1)
        @second_flavor_beer_1 = Beer.find_beers(@flavor_1)
        @second_flavor_beer_2 = Beer.find_beers(@flavor_1)
        @third_flavor_beer_1 = Beer.find_beers(@flavor_1)
        @third_flavor_beer_2 = Beer.find_beers(@flavor_1)

        render :index

    end

    private

    def beer_params
        params.require(:beer).permit(:name, :flavor_1, :flavor_2, :flavor_3)
    end

end
