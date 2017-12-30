
class Admin::NytimesController < ApplicationController

  def index
    @nytimes =Nytime.all
  end

  def new
    @nytime= Nytime.new
  end

  def create
     url = Nytime.nytimes_body(ny_params[:title])
     title = Nytime.nytimes_title(ny_params[:title])
     @ny_time= Nytime.new(title: title, url: url)
     if @ny_time.save!
        redirect_to admin_categories_path
     end
  end

  def show
    @article = Nytime.find(params[:id])
  end

  def destroy
    nytime= Nytime.find(params[:id])
    nytime.destroy
    flash[:success] = "Article deleted!"
    redirect_to admin_categories_path
  end

private

  def ny_params
      params.require(:nytime).permit(:title)
  end

end
