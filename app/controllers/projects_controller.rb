class ProjectsController < ApplicationController

  def show 
    @project = Project.find(params[:id])
    if params[:contestant_id]
      @project.contestants << Contestant.find(params[:contestant_id])
    end
  end
end