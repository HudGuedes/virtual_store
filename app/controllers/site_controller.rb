class SiteController < ApplicationController
  def index
    @products = Product.home_products
  end

  def search
    if params[:term].blank?
      flash[:alert] = 'A busca não pode estar em branco'
      redirect_to action: :index
    else
      @products = Product.search_from_term(params[:term])
    end
  end
end