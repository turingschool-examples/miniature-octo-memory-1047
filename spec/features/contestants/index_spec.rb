require "rails_helper"

RSpec.describe "the contestant index" do

  before :each do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)


    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
    ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)
  end

  # User Story 2 of 3

  # As a visitor,
  # When I visit the contestants index page ("/contestants")
  # I see a list of names of all the contestants
  # And under each contestants name I see a list of the projects (names) that they've been on
  
  # (e.g.   Kentaro Kameyama
  #         Projects: Litfit, Rug Tuxedo
  
  #         Jay McCarroll
  #         Projects: LeatherFeather)

  describe "As a visitor, when I visit a contestant's index page ('/contestants')" do
    it "I see a list of names of all the contestants, and under each name, I see a list of all the projects that they've been on" do
      visit "/contestants"
      expect(page).to have_content("Jay McCarrol")
      # expect("Jay McCarrol").to appear_before("Projects: News Chic")
      expect(page).to have_content("Projects: News Chic")
      expect(page).to have_content("Gretchen Jones")
      # expect("Gretchen Jones").to appear_before("Projects: News Chic, Upholstery Tuxedo")
      expect(page).to have_content("Projects: News Chic , Upholstery Tuxedo")
      expect(page).to have_content("Kentaro Kameyama")
      # expect("Kentaro Kameyama").to appear_before("Projects: Boardfit, Upholstery Tuxedo")
      expect(page).to have_content("Projects: Boardfit , Upholstery Tuxedo")
      expect(page).to have_content("Erin Robertson")
      # expect("Erin Robertson").to appear_before("Projects: Boardfit")
      expect(page).to have_content("Projects: Boardfit")

    end
  end
end