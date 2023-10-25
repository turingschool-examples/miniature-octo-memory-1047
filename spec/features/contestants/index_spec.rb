require 'rails_helper' 

RSpec.describe "Contestants index page (/contestants)" do 
  let(:recycled_material_challenge) { Challenge.create(theme: "Recycled Material", project_budget: 1000) } 
  let(:furniture_challenge) { Challenge.create(theme: "Apartment Furnishings", project_budget: 1000) } 
  let(:news_chic) { recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper") } 
  let(:boardfit) { recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes") } 
  let(:upholstery_tux) { furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch") } 
  let(:lit_fit) { furniture_challenge.projects.create(name: "Litfit", material: "Lamp Shade") } 
  let(:jay) { Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13) } 
  let(:gretchen) { Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12) } 
  let(:kentaro) { Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8) } 
  let(:erin) { Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15) } 
  
  before(:each) do 
    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)
    ContestantProject.create(contestant_id: kentaro.id, project_id: upholstery_tux.id)
    ContestantProject.create(contestant_id: kentaro.id, project_id: boardfit.id)
    ContestantProject.create(contestant_id: erin.id, project_id: boardfit.id)
  end

  describe "When I visit the contestants index page (/contestants)" do 
    it "shows a list of names of all the contestants and under each contestants name I see a list of the projects (names) that they've been on" do 
      visit "/contestants"
      save_and_open_page
      expect(page).to have_content("Contestants Index")
      expect(page).to have_content(jay.name)
      expect(page).to have_content("Projects: #{news_chic.name}")
      expect(page).to have_content(gretchen.name)
      expect(page).to have_content("Projects: #{news_chic.name} #{upholstery_tux.name}")
      expect(page).to have_content(kentaro.name)
      expect(page).to have_content("Projects: #{upholstery_tux.name} #{boardfit.name}")
      expect(page).to have_content(erin.name)
      expect(page).to have_content("Projects: #{boardfit.name}")
    end
  end
end 
