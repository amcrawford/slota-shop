class OilTypesController < ApplicationController
  def index
    @oil_types = OilType.all
  end

  def show
    name = OilType.storage_name(params[:name])
    @oil_type = OilType.find_by(name: name)
    @chips = @oil_type.chips
  end
end
