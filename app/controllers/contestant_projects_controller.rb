class ContestantProjectsController < ApplicationController
  

  def create
    @contestant = Contestant.find(params[:contestant_id])
    @project = Project.find(params[:project_id])
    ContestantProject.create(contestant_id: @contestant.id, project_id: @project.id)

    redirect_to "/projects/#{@project.id}"
  end
end