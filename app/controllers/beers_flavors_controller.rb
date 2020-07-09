class BeersFlavorsController < ApplicationController

    before_action :current_user
    before_action :redirect_user

end
