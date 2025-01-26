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
  @recipe = recipes["result"].find{|recipe| recipe["recipeId"] == recipe_id}
  
  end

  def category
    category_id = params[:id]
    url = "https://app.rakuten.co.jp/services/api/Recipe/CategoryRanking/20170426?applicationId=1045425526601869289&categoryId=#{category_id}"
    response = URI.parse(url).read
    recipes = JSON.parse(response)
    @recipes = recipes["result"].first(5)
    @category_name = get_category_name(category_id)
    # raise
  end

  private

  def get_category_name(category_id)
    # Map category IDs to names for display
    { "31" => "Meat"}[category_id]
  end
end
