class OrdersController < ApplicationController
  def index
    @orders = User.find(params[:user_id]).orders.all
  end

  def show
  end

  def create
    @order = Order.create(user_id: params[:user_id], total_price: params[:cart_total])
    ChipOrder.create_chip_order(@order, @cart)
    flash[:notice] = "Your order has been placed"
    redirect_to user_order_path(params[:user_id], @order)
  end
end
