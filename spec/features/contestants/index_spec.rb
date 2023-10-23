require "rails_helper"

RSpec.describe "Index Page" do 
  describe "Contestants index page visit" do 
    # US 2 
    it "shows the contestants and projects they've been on" do 

      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

      ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)

      visit "/contestants"

      expect(page).to have_content(gretchen.name)
      expect(page).to have_content("Projects:")
      expect(page).to have_content(news_chic.name)
      expect(page).to have_content(upholstery_tux.name)
    end
  end
end