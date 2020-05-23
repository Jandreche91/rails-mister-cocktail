class CocktailsController < ApplicationController
  before_action :getmy_cocktail, only: [:show]
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
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def getmy_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
