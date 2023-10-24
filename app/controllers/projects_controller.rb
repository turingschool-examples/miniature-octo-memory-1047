class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @theme = @project.challenge_theme
  end

end