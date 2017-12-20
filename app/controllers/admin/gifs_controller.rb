
class Admin::GifsController < ApplicationController

  def new
    @gif = Gif.new
  end

  def create
     url = Giphy.search(gif_params[:name]).first.fixed_height_image.url
     @gifs= Gif.new(name: gif_params[:name], url: url)
     if @gifs.save!
        redirect_to admin_categories_path
      end
        end
  #
  # def show
  #   # byebug
  #   # @gif = Gif.find(params[:id])
  #   render :show
  # end

  def destroy
    @gif= Gi.find(params[:id])
    @image.destroy
      flash[:success] = "image deleted!"
      redirect_to admin_categories_path
  end

private

  def gif_params
      params.require(:gif).permit(:name)
  end

  end
