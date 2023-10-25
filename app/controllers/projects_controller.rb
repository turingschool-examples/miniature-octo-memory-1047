class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @avg_exp = Project.avg_exp(@project)
    if params[:cont_id]
      @project.add_contestant(params[:cont_id])
    end
  end
end