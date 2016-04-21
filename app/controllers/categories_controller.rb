class CategoriesController < ApplicationController

  def index
    @category = Category.new
    @categories = Category.where(user_id: current_user.id)
  end

  def create
    cat = Category.new(category_params)
    cat.user = current_user
    if cat.save
      flash[:notification] = "Great Success!"
    else
      flash[:error] = cat.errors.full_messages.join(". ")
    end
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
