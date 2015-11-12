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
    @chip = Chip.new(chip_params)
    if @chip.save
      flash[:notice] = "Successfully Created Chip"
      redirect_to admin_chips_path
    else
      flash.now[:error] = @chip.errors.full_messages(', ')
      render :new
    end
  end

  private
    def chip_params
      params.require(:chip).permit(:name, :price, :description)
    end
end
