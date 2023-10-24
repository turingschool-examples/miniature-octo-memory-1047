require 'rails_helper'

RSpec.describe 'Project Show Page' do
  describe "project details" do
    it "can see that project's name and material" do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      # As a visitor,
        # When I visit a project's show page ("/projects/:id"),
        visit "/projects/#{news_chic.id}"
        # I see that project's name and material
        expect(page).to have_content("News Chic")
        expect(page).to have_content("Newspaper")
        # And I also see the theme of the challenge that this project belongs to.
        expect(page).to have_content("Recycled Material")
        # (e.g.    Litfit
        #     Material: Lamp Shade
        #   Challenge Theme: Apartment Furnishings)
    end

    it "can see the number of contestants on this project" do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
      
      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)
            
      #       User Story 3 of 3
      # As a visitor,
      # When I visit a project's show page
      visit "/projects/#{news_chic.id}"
      # I see a count of the number of contestants on this project
      save_and_open_page
      expect(page).to have_content("Number of Contestants: 1")

      # (e.g.    Litfit
      #     Material: Lamp Shade
      #   Challenge Theme: Apartment Furnishings
      #   Number of Contestants: 3 )
    end
  end
end