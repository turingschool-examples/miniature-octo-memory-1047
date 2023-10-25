require "rails_helper"

RSpec.describe "projects#show page" do 
  it "displays a project's name, material, and challenge theme" do
    challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    project = challenge.projects.create(name: "News Chic", material: "Newspaper")

    visit "/projects/#{project.id}"

    expect(page).to have_content("Project: News Chic")
    expect(page).to have_content("Newspaper")
    expect(page).to have_content("Recycled Material")
  end

  it "displays the number of contestants working on a project" do
    challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    project = challenge.projects.create(name: "News Chic", material: "Newspaper")

    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

    ContestantProject.create(contestant_id: jay.id, project_id: project.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: project.id)

    visit "/projects/#{project.id}"

    expect(page).to have_content("Number of Contestants: 2")

    save_and_open_page
  end

  it "displays the average age of each contestant working on the project" do

    challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    project = challenge.projects.create(name: "News Chic", material: "Newspaper")

    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

    ContestantProject.create(contestant_id: jay.id, project_id: project.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: project.id)
    
    visit "/projects/#{project.id}"

    expect(page).to have_content(38.0)
  end
end