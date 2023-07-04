class CategoriesController < ApplicationController
  def index; end

  def new 
    @category = Category.new
  end

  def create 
    @category = Category.new name: params[:name], icon: params[:icon], user: current_user
    if @category.save
      redirect_to categories_path
    else
      flash.alert = @category.errors.full_messages
      redirect_back(fallback_location: '/')
    end
  end
end 
