class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_recipe, only: [:show, :destroy, :edit, :update,]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  def index
    @recipes = Recipe.order(id: 'DESC')
  end

  def new
    @recipe = Recipe.new
  end

  def show
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      return redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
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

  def search
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result
  end

  private
  def recipe_params
    params.require(:recipe).permit(
      :dish_name,
      :ingredient,
      :make,
      :introduction,
      :image).merge(
        user_id: current_user.id
      )
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @recipe.user
  end
end
