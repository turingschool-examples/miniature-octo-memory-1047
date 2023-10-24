require "rails_helper"

RSpec.describe "projects#show page" do 
  it "displays a project's name and material" do
    challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    project = challenge.projects.create(name: "News Chic", material: "Newspaper")

    visit "/projects/#{project.id}"

    expect(page).to have_content("News Chic")
    expect(page).to have_content("Newspaper")
  end

  it "shows a list of projects each contestant is working on" do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)

    visit "/contestants"

    expect(page).to have_content("Jay McCarroll")
    expect(page).to have_content("Projects:\nNews Chic")
    expect(page).to have_content( "Gretchen Jones")
    expect(page).to have_content( "Projects:\nNews Chic")
    expect(page).to have_content( "Upholstery Tuxedo")
  end
end