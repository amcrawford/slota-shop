class OrdersController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_action :require_current_user

  def index
    @user = current_user
    @orders = @user.orders.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @total = @cart.total
  end

  def create
    @order = Order.new(user_id: current_user.id,
                       total_price: params[:order][:total_price],
                       address: params[:order][:address])
    @order_completion = CompleteOrder.new(@order, @cart)
    if @order_completion.create_order
      flash[:notice] = "Order was successfully placed"
      NotificationsController.notify(number_to_currency(@order.total_price))
      NotificationsController.call
      redirect_to orders_path
    else
      flash[:error] = "Cart cannot be empty."
      redirect_to cart_chips_path
    end
  end
end
