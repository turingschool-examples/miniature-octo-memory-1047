class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    require 'pry'; binding.pry
  end
end