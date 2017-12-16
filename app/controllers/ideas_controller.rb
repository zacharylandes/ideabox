
class IdeasController  < ApplicationController
    def new
      @idea = Idea.new
      @category = Category.all
    end

    def create
      @user = User.find(params[:user_id])
      idea = @user.ideas.new(idea_params)
      if idea.save
        redirect_to user_path(@user)
      end
    end
    def show
    end

    def idea_params
      params.require(:idea).permit(:title, :description, :category_id)
    end

  end
