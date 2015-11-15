class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.scope_action(params[:scope])
  end

  def update
    @order = Order.find(params[:id])
    @order.status_update(params[:new_status])
    if @order.save
      redirect_to dashboard_path
    else
      # something
    end
  end
end
