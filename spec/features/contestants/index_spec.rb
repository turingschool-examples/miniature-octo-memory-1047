require "rails_helper"

RSpec.describe "Contestant Index" do
  describe "User Story 2: As a visitor," do
    before(:each) do
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
     
    end

    describe "When I visit the contestants index page ('/contestants')" do
      it "shows a list of names of all the contestants" do

        visit "/contestants"

        expect(page).to have_content("Jay McCarroll")
        expect(page).to have_content("Gretchen Jones")
      end

      it "and under each contestants name I see a list of the project names they've been on" do

        visit "/contestants"
        expect(page).to have_content("Jay McCarroll")
        expect(page).to have_content("News Chic")
        expect("Jay McCarroll").to appear_before("News Chic")

        expect(page).to have_content("Gretchen Jones")
        expect(page).to have_content("Upholstery Tuxedo")
        expect("Gretchen Jones").to appear_before("Upholstery Tuxedo")

      end
    end
  end
end
