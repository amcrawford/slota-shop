class ChipsController < ApplicationController
  def index
    @chips = Chip.all
  end
end
