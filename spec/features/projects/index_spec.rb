require 'rails_helper'

RSpec.describe 'Projects show', type: :feature do
  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
  end

  describe 'When a user visits project show page /projects/:id' do
    it 'They see projects name and material' do
      visit "/projects/#{@upholstery_tux.id}"
      expect(page).to have_content(@upholstery_tux.name)
      expect(page).to have_content("Material: #{@upholstery_tux.material}")
    end

    xit 'They also see the challenge that this theme belongs to' do
      expect().to
    end
  end

end

# As a visitor,
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)