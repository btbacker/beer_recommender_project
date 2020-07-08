class UsersController < ApplicationController

    before_action :current_user
    # before_action :redirect_user
 
    def index
    
    end

    def show
        @user = User.find(params[:id])
        # byebug
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:message] = @user.errors.full_messages
            render :new
        end
    end

    def destroy
        @user = User.find(user_params[:id])
        @user.delete
        redirect_to users_path
    end

private

    def user_params
        params.require(:user).permit(:username, :password_digest, :location)
    end
end
