class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(session[:user_id])
    @user
  end



  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
    end

end
