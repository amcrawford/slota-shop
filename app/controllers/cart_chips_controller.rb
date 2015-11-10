class CartChipsController < ApplicationController
  def create
    flash[:notice] = "Added Slotachips to cart."
    redirect_to chips_path
  end
end
