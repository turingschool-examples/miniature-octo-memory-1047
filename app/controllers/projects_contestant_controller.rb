class ProjectsContestantController < ApplicationController
  def id
    params[:id]
  end
  def new
    Project.find(id).contestants.create!(
      name: params[:name],
      years_of_experience: params[:yoe].to_i,
      age: params[:age],
      hometown: params[:hometown])

    redirect_to "/projects/#{params[:id]}"
  end
end