class UsersController < ApplicationController
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
      redirect_to @user, notice: "Usuário foi criado com sucesso!"
      # Tire o método de comentário quando criar o helper.
      # Usuário depois de cadastrar-se acessa o sistema automaticamente sig_in(@user)
    else
      render action: :new # Corrigindo a linha para renderizar a ação :new
    end
  end

  private
  def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
