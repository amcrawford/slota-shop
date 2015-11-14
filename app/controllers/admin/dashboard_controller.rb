class Admin::DashboardController < Admin::BaseController
  def index
    @orders = Order.all
  end

  # def show
  #   binding.pry
  #   # @orders = Orders.
  # end

end
