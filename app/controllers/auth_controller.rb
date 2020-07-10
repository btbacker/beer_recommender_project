class AuthController < ApplicationController

    def login
    end

    def verify_username
        @user = User.find_by(username: params[:auth][:username])
        #byebug #lol
        if @user #&& @user.authenticate(params[:auth][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else flash.now[:alert] = ""
            render :login
        end
    end

    def logout
        session.clear
        redirect_to login_path
    end

end