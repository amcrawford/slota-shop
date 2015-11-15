class Admin::ChipsController < Admin::BaseController
  def index
    @chips = Chip.all
  end

  def new
    @chip = Chip.new
  end

  def create
    @chip = Chip.new(chip_params)
    if @chip.save
      flash[:notice] = "Successfully created Chip"
      redirect_to admin_chips_path
    else
      flash.now[:error] = @chip.errors.full_messages(', ')
      render :new
    end
  end

  def show
    @chip = Chip.find_by(slug: params[:id])
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

  def destroy
    @chip = Chip.find(params[:id])
    @chip.destroy
    redirect_to admin_chips_path
  end

  private
    def chip_params
      params.require(:chip).permit(:name, :price, :description, :image)
    end
end
