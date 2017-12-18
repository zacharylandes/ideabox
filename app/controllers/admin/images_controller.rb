
class Admin::ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image =Image.new(image_params)
    if @image.save!
      redirect_to admin_categories_path
    end
  end

  def show
    redirect_to admin_images_path
  end

  def destroy
    @image= Image.find(params[:id])
    @image.destroy
      flash[:success] = "image deleted!"
      redirect_to admin_categories_path
  end

private

  def image_params
      params.require(:image).permit(:name,:image)
  end

  end
