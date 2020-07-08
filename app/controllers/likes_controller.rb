class LikesController < ApplicationController

    before_action :current_user
    # before_action :redirect_user

    def new
        @like = Like.new
    end

    def create
        @beer = params[:beer]
        @like = Like.new(user_id: current_user.id, beer_id: @beer)
        render users/show
    end

end
