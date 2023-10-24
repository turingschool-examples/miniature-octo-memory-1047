class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @theme = @project.challenge_theme
    @count = @project.con_count
    @exp = @project.average_exp
  end

  def update
    project = Project.find(params[:id])
    contestant = Contestant.find(params[:contestant_id])

    project.contestants << contestant

    project.save
    redirect_to "/projects/#{project.id}"

  end

end