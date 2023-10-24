require 'rails_helper'


RSpec.describe '/projects/:id' do
  before :each do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    
    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
  end

  describe 'as a visitor' do
    describe 'when I visit /projects/:id' do
      it 'shows projects name material and challenge theme' do
        #US 1
          # As a visitor,
          # When I visit a project's show page ("/projects/:id"),
          visit "/projects/#{@news_chic.id}"

          # I see that project's name and material
          expect(page).to have_content(@news_chic.name)
          expect(page).to have_content(@news_chic.material)
          # And I also see the theme of the challenge that this project belongs to.
          expect(page).to have_content(@recycled_material_challenge.theme)
          # (e.g.    Litfit
          # Material: Lamp Shade
          # Challenge Theme: Apartment Furnishings)
      end
    end
  end
end