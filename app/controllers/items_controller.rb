class ItemsController < ApplicationController
  def index
    @chips = Item.all
  end
end
