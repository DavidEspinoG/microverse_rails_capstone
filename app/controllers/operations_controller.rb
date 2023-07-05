class OperationsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @operations = @category.operations.where(author: current_user).order('created_at DESC')
  end

  def new 
    @categories = Category.all
    @category = Category.find(params[:category_id])
  end

  def create
    puts params
  end
end
