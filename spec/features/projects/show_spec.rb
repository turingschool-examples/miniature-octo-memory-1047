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
      end

      #User Story 1
      it "I see that project's name and material. I also see the theme of the challenge that project belongs to" do
        visit "/projects/#{@news_chic.id}"

        expect(page).to have_content("News Chic")
        expect(page).to have_content("Newspaper")
        expect(page).to have_content("Recycled Material")
        expect(page).to_not have_content("Boardfit")
        expect(page).to_not have_content("Apartment Furnishings")
      end
    end
  end
end