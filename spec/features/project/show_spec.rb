require "rails_helper"

RSpec.describe "the project show page" do
  before(:each) do

  end

  it "shows details about the project and the theme of associated challenge" do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
  # As a visitor,

    visit("/projects/#{news_chic.id}")
  # When I visit a project's show page ("/projects/:id"),
  # I see that project's name and material
    expect(page).to have_content("News Chic")
    expect(page).to have_content("Newspaper")
  # And I also see the theme of the challenge that this project belongs to.
  # (e.g.    Litfit
  #     Material: Lamp Shade
  #   Challenge Theme: Apartment Furnishings)
    expect(page).to have_content("Recycled Material")
  end

  it "shows how many contestants on each project" do
    #     As a visitor,
    # When I visit a project's show page
    visit("/projects/#{news_chic.id}")
    # I see a count of the number of contestants on this project
    expect(page).to have_content("2")
    # (e.g.    Litfit
    #     Material: Lamp Shade
    #   Challenge Theme: Apartment Furnishings
    #   Number of Contestants: 3 )
  end
end