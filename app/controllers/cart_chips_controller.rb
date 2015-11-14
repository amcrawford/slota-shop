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
    @chips = @cart.cart_chips
  end

  def update
    chip = Chip.find(params[:id])
    @cart.add_or_remove_chip(params[:edit_action], chip)
    if @cart.remove_notice?(params[:edit_action])
      flash[:notice] = "Successfully removed
          #{view_context.link_to(chip.name, chip_path(chip.slug))}
          from your cart."
    end
    # if params[:edit_action] == "add"
    #   @cart.add_chip(chip.id)
    # else
    #   removed_chip = @cart.subtract_chip(chip.id)
    #   flash[:notice] = "Successfully removed
    #     #{view_context.link_to(removed_chip.name, chip_path(removed_chip.slug))}
    #     from your cart."
    # end
    @chips = @cart.cart_chips
    redirect_to cart_chips_path
  end

  def destroy
    chip = Chip.find(params[:id])
    @cart.contents.delete(params[:id])
    flash[:notice] = "Successfully removed
    #{view_context.link_to(chip.name, chip_path(chip.slug))}
    from your cart."
    redirect_to cart_chips_path
  end
end
