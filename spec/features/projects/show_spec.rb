require "rails_helper"

RSpec.describe "Show Page" do 
  describe "Project show page visit" do 
    # US 1, 3, ext 1 
    it "shows the prjects theme and material" do 

      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      
      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      
      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)

      visit "/projects/#{news_chic.id}"

      expect(page).to have_content("Project name: #{news_chic.name}")
      expect(page).to have_content("Material: #{news_chic.material}")
      expect(page).to have_content("Challenge Theme: #{recycled_material_challenge.theme}")

      expect(page).to have_content("Number of Contestants:")
      expect(page).to have_content(2)

      expect(page).to have_content("Average Contestant Experience:")
      expect(page).to have_content(12.5)
    end
  end
end