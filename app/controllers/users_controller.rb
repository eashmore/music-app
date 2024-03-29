class UsersController < ApplicationController
  def index
    render :index
  end

  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      render :show
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])

    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
