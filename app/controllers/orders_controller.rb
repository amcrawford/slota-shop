class OrdersController < ApplicationController
  before_action :require_current_user

  def index
    @user = current_user
    @orders = @user.orders.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.create(status: "Ordered", user_id: current_user.id, total_price: params[:cart_total])
    ChipOrder.create_chip_order(@order, @cart)
    @cart.contents.clear
    flash[:notice] = "Order was successfully placed"
    redirect_to orders_path
  end
end
