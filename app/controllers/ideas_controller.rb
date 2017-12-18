
class IdeasController  < ApplicationController
    def new
          # byebug
      @image = Image.all
      @user = User.find(params[:user_id])
      @idea = Idea.new
      @category = Category.all
    end

    def create
      @image = Image.all
      @user = User.find(params[:user_id])
      idea = @user.ideas.new(idea_params)
      if Image.find(params[:idea][:images])
        @img = Image.find(params[:idea][:images])
        # byebug
      end
      if idea.save
        redirect_to user_path(@user)
      end
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
      params.require(:idea).permit(:title, :description, :category_id, {:images =>[]})
    end

  end
