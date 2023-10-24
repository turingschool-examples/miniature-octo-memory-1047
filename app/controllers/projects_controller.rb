class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])

    @years_of_experience = 0
    if @project.contestants.count == 0
      @years_of_experience = 0
    else 
      @project.contestants.each do |contestant|
        num = contestant.years_of_experience
        @years_of_experience += num
      end
    end
    @avg_experience = @years_of_experience/@project.contestants.count.to_f
  end
end