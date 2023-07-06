class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new name: params[:name], icon: params[:icon], user: current_user
    if @category.save
      redirect_to categories_path
    else
      flash.alert = @category.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end
end
