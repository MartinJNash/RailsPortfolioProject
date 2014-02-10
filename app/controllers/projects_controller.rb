class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy] 

  def index
    @projects = Project.all
  end  

  def new
    @project = Project.new    
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Successfully created project"
      redirect_to @project
    else
      flash.now[:error] = "Project could not be saved"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to @project, notice: "Project was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if @project.destroy
      flash[:notice] = "Successfully deleted project."
      redirect_to posts_path
    end
  end

private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :technologies_used)
  end

end
