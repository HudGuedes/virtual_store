class ApplicationController < ActionController::Base

  before_action :parent_categories
  private

  def parent_categories
    @parent_categories = Category.parent_categories
  end
end
