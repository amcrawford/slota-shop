class CartChipsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    chip = Chip.find(params[:chip_id])
    @cart.add_chip(chip.id)
    session[:cart] = @cart.contents
    flash[:notice] = "Added #{view_context.link_to(chip.name, chip_path(chip.slug))} to cart."
    redirect_to chips_path
  end

  def index
    @chips = @cart.cart_chips
  end

  def update
    chip = Chip.find(params[:id])
    @cart.add_or_subtract_chip(params[:edit_action], chip)
    if @cart.remove_notice?(params[:edit_action])
      flash[:notice] = "Successfully removed #{view_context.link_to(chip.name, chip_path(chip.slug))} from your cart."
    end
    @chips = @cart.cart_chips
    redirect_to cart_chips_path
  end

  def destroy
    chip = Chip.find(params[:id])
    @cart.remove_chip_completely(chip.id)
    flash[:notice] = "Successfully removed #{view_context.link_to(chip.name, chip_path(chip.slug))} from your cart."
    redirect_to cart_chips_path
  end
end
