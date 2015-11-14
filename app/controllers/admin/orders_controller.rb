class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.scope_action(params[:scope])
  end
end
