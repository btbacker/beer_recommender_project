class ApplicationController < ActionController::Base
    helper_method :current_user, :redirect_user, :logged_in?

    def logged_in?
        !!current_user
    end
  
    def current_user
      user = User.find(session[:user_id]) if session[:user_id]
    end
  
    def redirect_user
      if !current_user
        flash[:message] = "Please log in to view this data"
        redirect_to login_path
      end
    end

end