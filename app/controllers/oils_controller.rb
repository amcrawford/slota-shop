class OilsController < ApplicationController
  def index
    @oils = Oil.all
  end

  def show
    @oil = Oil.find_by(slug: params[:slug])
    @chips = @oil.chips
  end
end
