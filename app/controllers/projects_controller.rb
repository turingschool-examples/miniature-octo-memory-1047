class ProjectsController < ApplicationController
  def id
    params[:id]
  end
  def show
    @project = Project.find(id)
  end
end