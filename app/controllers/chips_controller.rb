class ChipsController < ApplicationController
  def index
    @chips = Chip.available
  end

  def show
    @chip = Chip.find_by(slug: params[:slug])
  end
end
