class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
  @user = User.create(user_params)
  if @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  else
    render :new
  end
end

  def show
    @images = Image.all
    @user = User.find(params[:id])
    @idea = @user.ideas.new
    @category = Category.all
    @ideas =  Idea.where(:user_id => @user.id)
    # if Image.find(params[:idea][:images])
    #   # @img = Image.find(params[:idea][:images])
    # end
    # @img = Image.find(params[:idea][:images])
  end

private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
