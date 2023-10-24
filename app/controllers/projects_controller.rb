class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    # @contestants = Project.count_contestants
  end
end