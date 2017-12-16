class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category= Category.new
  end
  def create
    @category= Category.new
    category = @user.categories.new(category_params)
    if category.save
      redirect_to admin_categories_path(@user)
    end
  end
private
def category_params
    params.require(:category).permit(:name)
end

end
