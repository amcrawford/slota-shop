class OilTypesController < ApplicationController
  def index
    @oil_types = OilType.all
  end

  def show
    @oil_type = OilType.find(params[:id])
    @chips = @oil_type.chips
  end
end
