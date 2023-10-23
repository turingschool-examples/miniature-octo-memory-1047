require "rails_helper"

RSpec.describe "Show Page" do 
  describe "Project show page visit" do 
    it "shows the prjects theme and material" do 

      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      visit "/projects/#{news_chic.id}"

      expect(page).to have_content("Project name: #{news_chic.name}")
      expect(page).to have_content("Material: #{news_chic.material}")
      expect(page).to have_content("Challenge Theme: #{recycled_material_challenge.theme}")
    end
  end
end