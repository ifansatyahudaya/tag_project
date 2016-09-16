class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_tag_collection, :set_users_collection, only: [:new, :edit, :create, :update]
  before_action :authenticate_user!
  load_and_authorize_resource
  # GET /projects
  # GET /projects.json
  def index
    if current_user.role.name == "super admin"
      @projects = Project.all  
    elsif current_user.role.name == "admin"
      @projects = Project.by_company_id(current_user.company_id)  
    else
      @projects = Project.joins(:project_users).where("project_users.user_id = :user_id OR projects.user_id = :user_id", user_id: current_user.id)
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    # @tag = ActAsTaggableOn::Tag.find(params[:id])
    # @projects = Project.tagged_with(@tag.name)
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    @project.company_id = current_user.company_id
    @project.tag_list.add(params[:project][:tag_list])
    
    respond_to do |format|
      if @project.save
        @project.user_ids = params[:project][:user_ids]
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project.tag_list.add(params[:project][:tag_list])
    respond_to do |format|
      if @project.update(project_params)
        @project.user_ids = params[:project][:user_ids]
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def tag
    @projects = Project.tagged_with(params[:tag])
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, tag_list: [])
    end

    def set_tag_collection
      @tags_collection = Tag.all.collect {|t| [t.name, t.name]}
    end

    def set_users_collection
      @users_collection = User.by_company_id(current_user.company_id).where.not(id: current_user.id).collect {|c| [c.name, c.id]}  
    end
end