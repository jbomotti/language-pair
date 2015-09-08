class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(:username => params[:session][:username])
    if (@user && @user.password == params[:password])
      auth_login(@user)
      redirect_to @user
    end
  end

  def destroy
    session.destroy
    render 'index'
  end

  private
    def auth_login(user)
      session[:user_id] = user.id
    end

end
