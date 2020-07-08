class AuthController < ApplicationController

    def login
    end

    def verify_username
        @user = User.find_by(username: params[:auth][:username])
        if @user && @user.authenticate(params[:auth][:password])
            session[:user_id] = @user.user_id
            redirect_to users_path
        else flash[:message] = "Please enter your username and password"
            render :login
        end
        redirect_to user_path(@user)
    end

    def logout
        session.clear
        redirect_to login_path
    end

end