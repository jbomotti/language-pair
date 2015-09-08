class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(:username => params[:session][:username])
    if (user && user.password == params[:password])
      auth_login(user)
      render 'index'
    end
  end

  def destroy
    p "Session before: #{session[:user_id]}"
    session.destroy
    p "Session after: #{session[:user_id]}"
    render 'index'
  end

  private
    def auth_login(user)
      session[:user_id] = user.id
    end
    
end
