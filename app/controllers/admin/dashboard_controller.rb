class Admin::DashboardController < Admin::BaseController
  def index
    @orders = Order.desc_by_date
  end
end
