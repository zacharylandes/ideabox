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
    # if User.find(params[:id]).logged_in
    @user = User.find(params[:id])
  # end
    @idea = @user.ideas.new
    @category = Category.all
    @ideas =  Idea.where(:user_id => @user.id)
  end

private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
