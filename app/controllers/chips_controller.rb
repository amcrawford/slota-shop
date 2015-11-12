class ChipsController < ApplicationController
  def index
    @chips = Chip.all
  end

  def show
    @chip = Chip.find(params[:id])
  end
end
