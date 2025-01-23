require "json"
require "open-uri"

class RecipesController < ApplicationController
  def index
    url = "https://app.rakuten.co.jp/services/api/Recipe/CategoryRanking/20170426?applicationId=1045425526601869289"
    recipes_serialized = URI.parse(url).read
    recipes = JSON.parse(recipes_serialized)
    @recipes = recipes["result"].first(5)
  end

  def show
    recipe_id = params[:id]
    url = "https://app.rakuten.co.jp/services/api/Recipe/CategoryRanking/20170426?applicationId=1045425526601869289"
    recipes_serialized = URI.parse(url).read
    recipes = JSON.parse(recipes_serialized)
    @recipe = recipes["result"].find{|recipe| recipe["recipeId"].to_s == recipe_id}
  end

  def category
    
  end
end
