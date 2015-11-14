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
    @order = Order.new(user_id: current_user.id, total_price: params[:cart_total])
    @order_completion = CompleteOrder.new(@order, @cart)
    if @order_completion.create_order
      flash[:notice] = "Order was successfully placed"
      redirect_to orders_path
    else
      #something else
    end
  end
end
