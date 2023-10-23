require 'rails_helper'

RSpec.describe 'Projects show', type: :feature do
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

  describe 'When a user visits project show page /projects/:id' do
    it 'They see projects name and material, two different pages' do
      visit "/projects/#{@upholstery_tux.id}"
      expect(page).to have_content(@upholstery_tux.name)
      expect(page).to have_content("Material: #{@upholstery_tux.material}")

      visit "/projects/#{@lit_fit.id}"
      expect(page).to have_content(@lit_fit.name)
      expect(page).to have_content("Material: #{@lit_fit.material}")
    end

    it 'They also see the challenge that this theme belongs to' do
      visit "/projects/#{@upholstery_tux.id}"
      expect(page).to have_content("Challenge Theme: #{@upholstery_tux.challenge.theme}")
    end

    it 'They also see count of the number of contestants on this project' do
      visit "/projects/#{@upholstery_tux.id}"
      expect(page).to have_content("Number of Contestants: #{@upholstery_tux.contestant_count}")

      visit "/projects/#{@lit_fit.id}"
      expect(page).to have_content("Number of Contestants: #{@lit_fit.contestant_count}")
    end
  end

end
