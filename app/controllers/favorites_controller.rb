class FavoritesController < ApplicationController
  def create
    @recipe_favorite = Favorite.new(user_id: current_user.id, recipe_id: params[:recipe_id])
    @recipe_favorite.save
    redirect_back(fallback_location: root_path )
  end
  
  def destroy
    @recipe_favorite = Favorite.find_by(user_id: current_user.id, recipe_id: params[:recipe_id])
    @recipe_favorite.destroy
    redirect_back(fallback_location: root_path ) 
  end
end
