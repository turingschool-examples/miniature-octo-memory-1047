require "rails_helper"

RSpec.describe "project show" do
  before :each do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    visit "/projects/#{@news_chic.id}"
  end

  describe "US 1- visit a projects show page" do
    it "I see the project's name, material and also the theme of the challenge this project belongs to" do
      save_and_open_page

      expect(page).to have_content("Name: #{@news_chic.name}")
      expect(page).to have_content("Material: #{@news_chic.material}")
      expect(page).to have_content("Challenge Theme: #{@recycled_material_challenge.theme}")
    end
  end
end
