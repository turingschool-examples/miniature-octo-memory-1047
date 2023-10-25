class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @theme = @project.project_challenge_theme
  end
end