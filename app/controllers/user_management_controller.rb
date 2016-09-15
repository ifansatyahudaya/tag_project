class UserManagementController < ApplicationController
  before_action :set_role_collection, only: [:new, :edit, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.role.name == "super admin"
      @users = User.all_except(current_user)  
    else
      @users = User.all_except(current_user).by_company_id(current_user.company_id)  
    end
  end

  def new
    @user = User.new  
  end

  def create
    @user = User.new(user_params)
    @user.company_id = current_user.company_id
    if @user.save
      redirect_to user_management_index_path    
    else
      render 'new'
    end  
  end

  def show
  end

  def edit
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role_id)
  end

  def set_role_collection
    @role_collection = Role.where.not(id: Role::IDS[:SUPER_ADMIN]).collect {|r| [r.name, r.id]}  
  end
end
