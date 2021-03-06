class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to rooms_path
    end
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      cookies.signed[:user_id] = { value: user.id, expires: 1.month.from_now }
      log_in user
      redirect_to rooms_path
    else
      flash.now[:danger] = 'invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to login_path
  end
end
