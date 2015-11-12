class ChipsController < ApplicationController
  def index
    @chips = Chip.all
  end

  def show
    @chip = Chip.find_by(slug: params[:id])
  end
end
