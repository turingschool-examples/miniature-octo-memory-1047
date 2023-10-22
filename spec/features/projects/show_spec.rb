require "rails_helper"

RSpec.describe "Project Show" do

  describe "User Story 1: As a visitor," do 
    describe "When I visit a project's show page ('/projects/:id')" do 
      it "it has project's name and material" do
        #Challenge
        recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        #Project
        news_chic = recycled_material_challenge.projects.
        create(name: "News Chic", material: "Newspaper")

        visit "/projects/#{news_chic.id}"

        expect(page).to have_content("News Chic")
        expect(page).to have_content("Newspaper")
      end

      it "it also has the theme of the challenge that this project belongs to" do
        #Challenge
        recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        #Project
        news_chic = recycled_material_challenge.projects.
        create(name: "News Chic", material: "Newspaper")

        visit "/projects/#{news_chic.id}"
        
        expect(page).to have_content("Recycled Material")
      end
    end
  end

  describe "User Story 3: As a visitor," do
   describe "When I visit a project's show page" do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

      upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
      lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    
      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)
      
      it "it has a count of the number of contestants on this project" do

        visit "/projects/#{news_chic.id}"

        expect(page).to have_content(news_chic.contestants.count)
        
      end
    end
  end
end