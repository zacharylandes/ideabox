
class IdeasController  < ApplicationController
  def new
    @idea = Idea.new
  end
  def create
    @user = User.find(params[:id])
    @idea = @user.ideas.new()
  end
def show
end
  end
