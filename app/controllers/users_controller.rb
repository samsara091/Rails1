class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  def index
    @users = User.all
  end
  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to @user, notice: 'User was successfully created.'
  	else
  		render action: "new"
  	end
  end
  def show
  	@user = User.find(params[:id])
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :salt, :encrypt_password)
  end

end

