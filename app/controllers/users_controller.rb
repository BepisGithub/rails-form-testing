class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    if User.exists? params[:id]
      @user = User.find(params[:id])
    else
      flash[:danger] = 'User doesn\'t exist'
      redirect_to new_user_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'user saved'
      redirect_to @user
    else
      flash[:danger] = 'User cant be saved'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'user saved'
      redirect_to @user
    else
      flash[:danger] = 'User cant be saved'
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:username,:password,:email)
    end
end
