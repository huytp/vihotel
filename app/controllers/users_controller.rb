class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_authorization
  before_action :set_user, only: [:edit, :update]
  load_resource
  authorize_resource
  def index
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update(get_params)
      flash[:notice] = "Update User Type Successfully"
      redirect_to users_path
    end
  end

  protected
    def set_user
      @user = User.find(params[:id])
    end
    def check_authorization
      if current_user.staff?
        redirect_to error_errors_path
      end
    end

    def get_params
      params.require(:user).permit(:user_type)
    end
end
