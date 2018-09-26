class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    user = users_params
    @user = User.find_by(email: user[:email], password: user[:password])
    if @user.nil?
      @alert = "error"
      @user = User.new
      render :new
    else
      session[:user_id] = @user.id
      session[:user_email] = @user.email
      redirect_to root_path
    end

  end

  private
  def users_params
    params.require(:user).permit(:email, :password)
  end


end
