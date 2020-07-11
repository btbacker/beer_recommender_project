class OrdersController < ApplicationController

    before_action :current_user

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
        @beer_ids = params[:beers]
        @beers = []
        @beer_ids.each do |beer|
            @beers << Beer.find(beer)
        end
        @order = Order.new
    end

    def create
        @current_user = current_user
        @order = Order.create(user_id: current_user.id)
        Flight.create(beer_id: params[:beer_1].to_i, order_id: @order.id)
        Flight.create(beer_id: params[:beer_2].to_i, order_id: @order.id)
        Flight.create(beer_id: params[:beer_3].to_i, order_id: @order.id)
        Flight.create(beer_id: params[:beer_4].to_i, order_id: @order.id)
        Flight.create(beer_id: params[:beer_5].to_i, order_id: @order.id)
        Flight.create(beer_id: params[:beer_6].to_i, order_id: @order.id)
        redirect_to order_path(@order)
    end

end
