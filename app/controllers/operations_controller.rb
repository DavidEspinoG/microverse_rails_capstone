class OperationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @category = Category.find(params[:category_id])
    @operations = @category.operations.where(author: current_user).order('created_at DESC')
  end

  def new
    @categories = current_user.categories
    @category = Category.find(params[:category_id])
  end

  def create
    if params[:category]
      @operation = Operation.new name: params[:name], amount: params[:amount],
                                 author: current_user
      if @operation.save
        params[:category].each do |e|
          category = Category.find(e)
          @operation.categories << category
        end
        redirect_to category_operations_path(params[:category].first)
      else
        flash.alert = @operation.errors.full_messages
        redirect_back(fallback_location: root_path)
      end
    else
      flash.alert = 'Choose at least one category'
      redirect_back(fallback_location: root_path)
    end
  end
end
