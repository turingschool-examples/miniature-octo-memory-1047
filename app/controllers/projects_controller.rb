class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @theme = @project.challenge_theme
  end

  # def update
  #   @project = Project.find(params[:id])
  #   # require 'pry'; binding.pry
  #   @project.contestant.update(params[:contestant_id])
  #   redirect_to "/projects/#{@project.id}"
  # end
end