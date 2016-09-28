class UserManagementController < ApplicationController
  before_action :set_role_collection, only: [:new, :edit, :create]
  before_action :set_projects_collection, only: [:new, :edit, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.role.name == "super admin"
      @users = User.all_except(current_user).order(role_id: :asc).order(company_id: :asc)  
    elsif current_user.role.name == "admin"
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

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_management_index_path(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }      
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }       
      end  
    end  
  end

  def destroy
    @user.destroy
    respond_to do |format|      
      format.html { redirect_to user_management_index_url, nitice: 'User was successfully destroyed' }
      format.json { head :no_content }
    end    
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role_id, { project_ids: [] })
  end

  def set_role_collection
    @role_collection = Role.where.not(id: Role::IDS[:SUPER_ADMIN]).collect {|r| [r.name, r.id]}  
  end

  def set_projects_collection
    @projects_collection = Project.by_company_id(current_user.company_id).collect {|c| [c.name, c.id]}  
  end
end
