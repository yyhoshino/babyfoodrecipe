class CommentsController < ApplicationController
before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comments = @recipe.comments.includes(:user)
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.recipe_id = @recipe.id
    @comment.save
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_comments = @recipe.comments
    if Comment.find_by(id: params[:id], recipe_id: params[:recipe_id]).destroy
      redirect_to recipe_path(@recipe)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
