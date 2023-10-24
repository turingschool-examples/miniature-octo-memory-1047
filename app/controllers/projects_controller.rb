class ProjectsController < ApplicationController
  
  def show
    @projects = Project.all
    @project = Project.find(params[:id])
  end

end