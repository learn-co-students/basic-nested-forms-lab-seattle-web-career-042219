class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new

    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.ingredients.build
    #@recipe.ingredients.new
    #byebug
    #@recipe.ingredients.new
  end

  def create
    #byebug
    @recipe = Recipe.create(recipe_params)
    #byebug
    redirect_to @recipe

  end

  private
  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [
        :name,
        :quantity
      ]
    )
  end
end
