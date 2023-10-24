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
  end
end