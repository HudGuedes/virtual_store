class CategoriesController < ApplicationController

  def show
    @categories = Category.childrens(params[:id])
    @products = Product.from_categories(@categories.pluck(:id))
  end
end