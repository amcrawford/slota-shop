class ChipsController < ApplicationController
  def index
    @chips = Chip.all
  end

  def show

  end
end
