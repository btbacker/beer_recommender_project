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
           flavors =  params["beer"]["flavor_ids"].map {|flavor| flavor}
        end

        @beers = []
        6.times do 
            @beers << Beer.find_beers(flavors.sample)
        end

        render :index

    end

    private

    def beer_params
        params.require(:beer).permit(flavor_ids:[])
    end

end
