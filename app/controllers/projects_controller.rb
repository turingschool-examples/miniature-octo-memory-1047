class ProjectsController < ApplicationController
  def new
  end
  
  def show
    @project = Project.find(params[:id])
    @challenge = @project.challenge
  end
end
