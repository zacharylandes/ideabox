
class ImagesController  < ApplicationController
  def new
    @image = Image.new
  end
  def create
    @user = User.find(params[:id])
    @idea = @user.ideas.new()
  end
def show
end
  end
