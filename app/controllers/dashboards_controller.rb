class DashboardsController < ApplicationController
  def index
    if current_user.role.name == "super admin"
      @projects = Project.all.order(user_id: :asc)  
    elsif current_user.role.name == "admin"
      @projects = Project.by_company_id(current_user.company_id).order(updated_at: :desc)  
    else
      @projects = Project.joins(:project_users).where("project_users.user_id = :user_id OR projects.user_id = :user_id", user_id: current_user.id).order(updated_at: :desc)
    end  
  end
end
