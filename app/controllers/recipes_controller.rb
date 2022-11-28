class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
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
    params.require(:recipe).permit(:dish_name, :ingredient, :make, :introduction, :image)
  end
end
