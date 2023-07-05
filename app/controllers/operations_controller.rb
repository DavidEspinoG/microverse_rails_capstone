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
    @operation = Operation.new name: params[:name], amount: params[:amount],
                               author: current_user
    flash.alert = 'Choose at least one category'
    redirect_back(fallback_location: root_path)
    if @operation.save
      params[:category].each do |e|
        category = Category.find(e)
        @operation.categories << category
      end
      redirect_to root_path
    else
      flash.alert = @operation.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end
end
