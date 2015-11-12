class Admin::ChipsController < Admin::BaseController
  def index
    @chips = Chip.all
  end

  def show
  end

  def edit
    @chip = Chip.find(params[:id])
  end

  def update
    @chip = Chip.find(params[:id])
    if @chip.update(chip_params)
      flash[:notice] = "Successfully Edited Chip"
      redirect_to admin_chips_path
    else
      flash.now[:error] = @chip.errors.full_messages(', ')
      render :edit
    end
  end

  private
    def chip_params
      params.require(:chip).permit(:name, :price, :description)
    end
end
