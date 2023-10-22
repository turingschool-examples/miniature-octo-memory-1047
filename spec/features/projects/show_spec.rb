require "rails_helper"

RSpec.describe "Project Show Page", type: :feature do
  describe "As a visitor" do
    describe "When I visit '/projects/:id'" do
      before(:each) do
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

      #User Story 1
      it "I see that project's name and material. I also see the theme of the challenge that project belongs to" do
        visit "/projects/#{@news_chic.id}"

        expect(page).to have_content("News Chic")
        expect(page).to have_content("Newspaper")
        expect(page).to have_content("Recycled Material")
        expect(page).to_not have_content("Boardfit")
        expect(page).to_not have_content("Apartment Furnishings")
        save_and_open_page
      end

      #User Story 3
      it "I see a count of the number of contestants on this project" do
        visit "/projects/#{@news_chic.id}"

        expect(page).to have_content("Number of Contestants: 2")

        visit "/projects/#{@lit_fit.id}"

        expect(page).to have_content("Number of Contestants: 0")
      end
    end
  end
end