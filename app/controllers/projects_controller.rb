class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @theme = @project.challenge_theme
    @count = @project.con_count
    @exp = @project.average_exp
  end

end