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
    if params[:recipe].present?
      @recipe = JSON.parse(params[:recipe])
    else
      recipe_id = params[:id]
      url = "https://app.rakuten.co.jp/services/api/Recipe/CategoryRanking/20170426?applicationId=1045425526601869289"
      recipes_serialized = URI.parse(url).read
      recipes = JSON.parse(recipes_serialized)
      @recipe = recipes["result"].find { |recipe| recipe["recipeId"].to_s == recipe_id }
    raise
    end
  end

  def category
    category_id = params[:id]
    url = "https://app.rakuten.co.jp/services/api/Recipe/CategoryRanking/20170426?applicationId=1045425526601869289&categoryId=#{category_id}"
    response = URI.parse(url).read
    recipes = JSON.parse(response)
    @recipes = recipes["result"]
    @category_name = get_category_name(category_id)
    raise
  end

  private

  def get_category_name(category_id)
    # Map category IDs to names for display
    { "31" => "Meat", "12" => "Veggies", "32" => "Fish", "33" => "Eggs",
      "35" => "Soy/Tofu", "14" => "Rice", "16" => "Noodle", "17" => "Soups",
      "18" => "Salads", "27" => "Drinks", "20" => "Bento Box", "39" => "Healthy",
      "52" => "Spring", "53" => "Summer", "54" => "Fall", "55" => "Winter" }[category_id]
  end
end
