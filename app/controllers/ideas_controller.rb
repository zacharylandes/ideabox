
class IdeasController  < ApplicationController
    def new
          # byebug
      @image = Image.all
      @user = User.find(params[:user_id])
      @idea = Idea.new
      @category = Category.all
    end

    def create
      ip = idea_params
      ip[:image_ids].shift
      user = User.find(params[:user_id])
      idea = user.ideas.create(ip)
        redirect_to user_path(user)
    end

    def edit
      @category = Category.all
      @user = User.find(params[:user_id])
      @idea = Idea.find(params[:id])
    end

    def update
      @user = User.find(params[:user_id])
      @category = Category.all
      @idea = Idea.find(params[:id])
      @idea.update(idea_params)
      flash[:success] = "idea updated!"
      redirect_to user_path(@user)
    end

    def destroy
      @category = Category.all
      @user = User.find(params[:user_id])
      @idea = Idea.find(params[:id])
      @idea.destroy
        redirect_to user_path(@user)
    end

    def idea_params
      params.require(:idea).permit(:title, :description, :category_id, {:image_ids =>[]})
    end

  end
