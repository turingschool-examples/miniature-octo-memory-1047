require "rails_helper"

RSpec.describe "Project Show" do

  # User Story 1: As a visitor, 
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