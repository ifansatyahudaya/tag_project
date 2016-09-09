class UserManagementController < ApplicationController
  def index
    @users = User.all  
  end

  # def new
  #   @user = User.new  
  # end

  # def create
  #   @user = User.new(user_params)  
  # end

  # private

  # def set_user
  #   @user = User.find(params[:id])  
  # end

  # def project_params
  #   params.require(:project).permit(:name, :description, :tag_list)
  # end

  # def user_params
  #   params.require(:user).permit(:name, :)
  # end
end
