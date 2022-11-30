class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :destroy]
  def index
    @recipes = Recipe.order(id: 'DESC')
  end

  def new
    @recipe = Recipe.new
  end

  def show
  end

  def destroy
    @recipe.destroy
    redirect_to root_path
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(
      :dish_name,
      :ingredient,
      :make,
      :introduction,
      :image)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

end
