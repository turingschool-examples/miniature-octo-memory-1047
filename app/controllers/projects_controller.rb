class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    if params[:cont_id]
      @project.add_contestant(params[:cont_id])
    end
    @avg_exp = Project.avg_exp(@project)
  end
end