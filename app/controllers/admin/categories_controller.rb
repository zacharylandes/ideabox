class Admin::CategoriesController < Admin::BaseController

  def index
    @gif = Gif.new
    @gifs = Gif.all
    # @gifs = Giphy.search(params[:name])
    @image = Image.new
    @images= Image.all
    @category= Category.new
    @categories = Category.all
  end

  def new
    @image = Image.new
    @category= Category.new
  end

  def create
    @category= Category.new(category_params)
    if @category.save!
      redirect_to admin_categories_path
    else
    end
  end
  def edit
    @category = Category.find(params[:id])
  end
  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    flash[:success] = "category updated!"
    redirect_to admin_categories_path
  end
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = "category deleted!"
    redirect_to admin_categories_path
  end
  # def show
  #   @catego
  # end
private
def category_params
    params.require(:category).permit(:name)
end

end
