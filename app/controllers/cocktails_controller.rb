class CocktailsController < ApplicationController
  before_action :getmy_cocktail, only: [:show, :update, :destroy]
  def index
    @cocktails = Cocktail.all
    @new_cocktail = Cocktail.new
    @array_of_pics = ['cocktail1.jpg', 'cocktail2.jpg', 'cocktail3.jpg',
      'cocktail4.jpg', 'cocktail5.jpg', 'cocktail6.jpg']
  end

  def create
    @new_cocktail = Cocktail.new(cocktail_params)
    if @new_cocktail.save
      redirect_to cocktail_path(@new_cocktail)
    else
      render :index
    end
  end

  def show
    @doses = @cocktail.doses
    @new_dose = Dose.new
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail.destroy
    redirect_to root_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :id)
  end

  def getmy_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
