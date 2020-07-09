class LikesController < ApplicationController

    before_action :current_user
    # before_action :redirect_user

    def new
        @like = Like.new
        @beer = params[:beer]
    end

    def create
        @beer = params[:beer]
        @like = Like.create(user_id: current_user.id, beer_id: @beer)
        redirect_to beer_path(@beer)
    end

end
