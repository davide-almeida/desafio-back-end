class Panel::UsersController < PanelController
	before_action :set_user, only: [:edit, :update, :destroy]
	
  def index
    @users = User.all
  end

  def new
    @user = User.new

  end

  def create
    @user = User.new(params_user)
    @user.status = true
    
    if @user.save
      redirect_to panel_users_path, notice: "O cadastro #{@user.email} foi realizado com sucesso!"
    else
      render :new
    end
  end

  def edit
    options_for_select

  end

  def destroy
    if @user.id != 1
      user_email = @user.email
      if @user.destroy
        redirect_to panel_users_path, notice: "O cadastro #{user_email} foi excluído com sucesso!"
      else
        render :index
      end
    else
      redirect_to panel_users_path, notice: "O cadastro #{@user.email} não pode ser excluído"
    end

  end

  def update
    options_for_select
    passwd = params[:user][:password]
    passwd_confirmation = params[:user][:password_confirmation]
    if passwd.blank? && passwd_confirmation.blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update(params_user)
      redirect_to panel_users_path, notice: "O cadastro #{@user.email} foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  private
    def options_for_select
      @status_options_for_select = ["Inativo", "Ativo"]
    end

    def set_user
      @user = User.find(params[:id])
    end

    def params_user
      params.require(:user).permit(:email, :password, :password_confirmation, :status)
    end

end
