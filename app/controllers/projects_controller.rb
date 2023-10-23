class ProjectsController < ApplicationController
  def show 
    @project = Project.find(params[:id]) 
    @theme = @project.challenge.theme 
    # require 'pry'; binding.pry
  end
end