require 'rails_helper'

RSpec.describe 'Contestants Index Page' do
  describe "index page has list of all contestants names and projects" do
    it "can see a list of all contestants names and projects" do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
      
      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)
      # As a visitor,
      # When I visit the contestants index page ("/contestants")
      visit "/contestants"
      # I see a list of names of all the contestants
      expect(page).to have_content("Jay McCarroll")
      expect(page).to have_content("Gretchen Jones")
      # And under each contestants name I see a list of the projects (names) that they've been on
      expect(page).to have_content("News Chic")
      expect(page).to have_content("Upholstery Tuxedo")
      # (e.g.   Kentaro Kameyama
      #         Projects: Litfit, Rug Tuxedo

      #         Jay McCarroll
      #         Projects: LeatherFeather)
    end
  end
end