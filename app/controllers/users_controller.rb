class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]
  before_action :correct_user?, only: [:edit, :update, :destroy]
def index
@users = User.all  # @users is an instance variable that will be available to the view (index) and all other views in this
end
  def show
  @user = User.find(params[:id])

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    sign_out
    redirect_to root_path, status: :see_other
  end


  private
  def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
