class OrdersController < ApplicationController

    before_action :current_user
    # before_action :redirect_user

    def show
        @order = Order.find(params[:id])
    end

    def index
        
    end
    
    def new
        @current_user = current_user
        @beer_1 = Beer.find(params[:beer_1])
        @beer_2 = Beer.find(params[:beer_2])
        @beer_3 = Beer.find(params[:beer_3])
        @beer_4 = Beer.find(params[:beer_4])
        @beer_5 = Beer.find(params[:beer_5])
        @beer_6 = Beer.find(params[:beer_6])
        @order = Order.new
    end

    def create
        byebug
        @current_user = current_user
        @order = Order.create(user_id: current_user.id)
        Flight.create(beer_id: params[:beer_1])
        @beer_1 = Beer.find(params[:beer_1])
        @beer_2 = Beer.find(params[:beer_2])
        @beer_3 = Beer.find(params[:beer_3])
        @beer_4 = Beer.find(params[:beer_4])
        @beer_5 = Beer.find(params[:beer_5])
        @beer_6 = Beer.find(params[:beer_6])
        redirect_to order_path(@order)
    end

end
