
class SessionsController  < ApplicationController


  def create
    user = User.find_by(username: params[:username])
    if  user && user.authenticate(params[:password])&& user.admin?
          session[:user_id] = user.id
          redirect_to admin_categories_path
    elsif user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to user_path(user)
    else
      flash[:notice] = "Invalid Credentials"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

 def authenticate(unencrypted_password)
   BCrypt::Password.new(password_digest).is_password?(unencrypted_password) && self
 end
end
