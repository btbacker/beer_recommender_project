class OrdersController < ApplicationController

    before_action :current_user
    before_action :redirect_user

    def show
        @order = Order.find(params[:id])
        @beers = []
        @order.flights.each do |flight|
            @beers << Beer.all.find(flight.beer_id)
        end
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
        @current_user = current_user
        @order = Order.create(user_id: current_user.id)
        @beer_1 = Beer.find(params[:beer_1])
        Flight.create(beer_id: @beer_1.id, order_id: @order.id)
        @beer_2 = Beer.find(params[:beer_2])
        Flight.create(beer_id: @beer_2.id, order_id: @order.id)
        @beer_3 = Beer.find(params[:beer_3])
        Flight.create(beer_id: @beer_3.id, order_id: @order.id)
        @beer_4 = Beer.find(params[:beer_4])
        Flight.create(beer_id: @beer_4.id, order_id: @order.id)
        @beer_5 = Beer.find(params[:beer_5])
        Flight.create(beer_id: @beer_5.id, order_id: @order.id)
        @beer_6 = Beer.find(params[:beer_6])
        Flight.create(beer_id: @beer_6.id, order_id: @order.id)
        redirect_to order_path(@order)
    end

end
