
class SessionsController  < ApplicationController
  def new
  end

  def create

  user = User.find_by(username: params[:username])
  if  user && user.authenticate(params[:password])&& user.admin?
        session[:user_id] = user.id
        redirect_to admin_categories_path
  elsif user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to user_path(user)
  else
    render :new
  end
end

 def authenticate(unencrypted_password)
   BCrypt::Password.new(password_digest).is_password?(unencrypted_password) && self
 end
end
