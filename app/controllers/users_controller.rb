class UsersController < ApplicationController

  def new
  end

  def create
    
  end

  private
    def user_params
      params.permit(:username,:password,:email)
    end
end
