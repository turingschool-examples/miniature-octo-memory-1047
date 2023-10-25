require 'rails_helper' 

RSpec.describe "Projects show page (/projects/:id)" do 
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
    ContestantProject.create(contestant_id: jay.id, project_id: boardfit.id)
  end
  
  describe " When I visit a projects show page (/projects/:id)" do 
    it "shows that projects name and material, as well as the theme of the challenge the project belongs to" do 
      visit "/projects/#{lit_fit.id}"

      expect(page).to have_content("Litfit")
      expect(page).to have_content("Material: Lamp Shade")
      expect(page).to have_content("Challenge Theme: Apartment Furnishings")
    end

    it "shows a count of the number of contestants on this project" do 
      visit "/projects/#{boardfit.id}"
      expect(page).to have_content("Boardfit")
      expect(page).to have_content("Material: Cardboard Boxes")
      expect(page).to have_content("Challenge Theme: Recycled Material")
      expect(page).to have_content("Number of Contestants: 3")
    end

    it "shows the average years of experience for the contestants that worked on that project" do 
      visit "/projects/#{boardfit.id}"
      expect(page).to have_content("Boardfit")
      expect(page).to have_content("Material: Cardboard Boxes")
      expect(page).to have_content("Challenge Theme: Recycled Material")
      expect(page).to have_content("Number of Contestants: 3")
      expect(page).to have_content("Average Contestant Experience: 12.0 years")
    end

    describe "Adding a contestant to a project" do 
      it "has a form to add a contestant to this project using an existing contestants id" do 
        visit "/projects/#{boardfit.id}"
        within("#add_contestant") do
          expect(page).to have_field(:contestant_id)
        end
      end

      it "takes me back to the project's show page, And I see that the number of contestants has increased by 1" do 

        visit "/projects/#{boardfit.id}"
        within("#add_contestant") do
          fill_in :contestant_id, with: "#{gretchen.id}"
        end
        click_button "Add Contestant To Project"
        
        expect(current_path).to eq("/projects/#{boardfit.id}")
        expect(page).to have_content("Number of Contestants: 4")
        expect(page).to have_content("Average Contestant Experience: 12.0 years")
      end
      
      it "will add the project under the contestants name on the contestant index page (/contestants)" do 
        visit "/projects/#{boardfit.id}"
        within("#add_contestant") do
          fill_in :contestant_id, with: "#{gretchen.id}"
        end
        click_button "Add Contestant To Project"
        visit "/contestants"

        expect(page).to have_content(gretchen.name)
        expect(page).to have_content("Projects: #{news_chic.name} #{upholstery_tux.name} #{boardfit.name}")
      end
    end
  end
end 