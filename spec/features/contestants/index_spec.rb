require 'rails_helper'

RSpec.describe 'Contestants Index page', type: :feature do
  describe "I visit the contestants index page ('/contestants')" do 
    it "I see a list of names of all the contestants and under each contestant's name I see a list of the projects (names) that they've been on" do 
      recycled_material_challenge = Challenge.create(theme: 'Recycled Material', project_budget: 1000)
      furniture_challenge = Challenge.create(theme: 'Apartment Furnishings', project_budget: 1000)
      
      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      boardfit = recycled_material_challenge.projects.create(name: 'Boardfit', material: 'Cardboard Boxes')
      upholstery_tux = furniture_challenge.projects.create(name: 'Upholstery Tuxedo', material: 'Couch')
      

      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      kentaro = Contestant.create(name: 'Kentaro Kameyama', age: 30, hometown: 'Boston', years_of_experience: 8)

      ContestantProject.create(contestant: jay, project: news_chic)
      ContestantProject.create(contestant_id: kentaro.id, project_id: upholstery_tux.id)
      ContestantProject.create(contestant_id: kentaro.id, project_id: boardfit.id)

      visit '/contestants'
      
      expect(page).to have_content('Jay McCarroll')
      expect(page).to have_content('News Chic')

      expect(page).to have_content('Kentaro Kameyama')
      expect(page).to have_content('Upholstery Tuxedo') 
      expect(page).to have_content('Boardfit')
    end
  end
end
