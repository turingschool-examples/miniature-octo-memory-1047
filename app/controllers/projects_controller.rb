class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id]) 
    @challenge = Challenge.find(@project.challenge_id)
    @count = @project.contestants.count
  end
end