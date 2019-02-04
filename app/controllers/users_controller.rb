class UsersController < ApplicationController
  def show
    if (u_ser_signed_in?)
      @users = USer.all
      @user = USer.find_by(params[:id])
    else
      redirect_to (root_path)
    end
  end
  def index
    if (u_ser_signed_in?)
      @user = USer.find(params[:id])
    else
      redirect_to(root_path)
    end
  end
end