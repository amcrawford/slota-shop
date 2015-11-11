class CartChipsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    chip = Chip.find(params[:chip_id])
    @cart.add_chip(chip.id)
    session[:cart] = @cart.contents
    flash[:notice] = "Added Slotachips to cart."
    redirect_to chips_path
  end

  def index
    @chips = CartChip.find_chips(@cart.contents)
    @total = CartChip.find_total(@chips)
  end
end
