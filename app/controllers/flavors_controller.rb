class FlavorsController < ApplicationController

    before_action :current_user
    before_action :redirect_user

    def index
        @flavors = Flavor.all
    end

    def show
        @flavor = Flavor.find(params[:id])
    end

end