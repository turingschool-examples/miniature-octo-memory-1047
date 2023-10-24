require 'rails_helper'

RSpec.describe 'Projects Show page' , type: :feature do
 describe "When I visit a project's show page ('/projects/:id')" do 
  it "I see that project's name and material and I also see the theme of the challenge that this project belongs to." do 
    challenge = Challenge.create(theme: 'Test Theme', project_budget: 1000)
    project = challenge.projects.create(name: 'Test Project', material: 'Test Material')
    
    visit "/projects/#{project.id}"

    expect(page).to have_content(project.name)
    expect(page).to have_content("Material: #{project.material}")
    expect(page).to have_content("Challenge Theme: #{challenge.theme}")

  end
 end
 describe "When I visit a project'show page ('/projects/:id')" do 
    it "I see a count of the number of contestants on this project" do 
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

      visit "/projects/#{news_chic.id}"
save_and_open_page 
      expect(page).to have_content("Contestant Count:")  
   end
  end
end
