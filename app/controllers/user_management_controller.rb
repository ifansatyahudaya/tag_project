class UserManagementController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all 
  end

  def new
    @user = User.new  
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to root_path    
      else
        render 'new'
      end  
  end
  
  private

  def set_user
    @user = User.find(params[:id])  
  end

  def project_params
    params.require(:project).permit(:name, :description, :tag_list)
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
