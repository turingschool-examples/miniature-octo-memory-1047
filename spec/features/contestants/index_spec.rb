require 'rails_helper'

RSpec.describe 'Contestants index', type: :feature do
  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
  end

  describe 'When a user visits contestats index page /contestants' do
    it 'They see a list of all contestants' do
      
      visit "/contestants"

      within "#contestant-#{@jay.id}" do
        expect(page).to have_content(@jay.name)
      end

      within "#contestant-#{@gretchen.id}" do
        expect(page).to have_content(@gretchen.name)
      end
    end

    xit 'They see list of project names for each contestant' do

    end
  end
end
