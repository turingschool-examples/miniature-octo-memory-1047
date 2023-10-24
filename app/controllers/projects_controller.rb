class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @challenge = @project.challenge
    # @contestants_count = ContestantProject.where(project: @project).count
    @contestants_count = ContestantProject.all.where("project_id = #{@project.id}").count
  end

end