require 'rails_helper' 

RSpec.describe "Projects show page (/projects/:id)" do 
  let(:recycled_material_challenge) { Challenge.create(theme: "Recycled Material", project_budget: 1000) } 
  let(:furniture_challenge) { Challenge.create(theme: "Apartment Furnishings", project_budget: 1000) } 
  let(:news_chic) { recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper") } 
  let(:boardfit) { recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes") } 
  let(:upholstery_tux) { furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch") } 
  let(:lit_fit) { furniture_challenge.projects.create(name: "Litfit", material: "Lamp") } 
  
  describe " When I visit a projects show page (/projects/:id)" do 
    it "shows that projects name and material, as well as the theme of the challenge the project belongs to" do 
      visit "/projects/#{lit_fit.id}"

      expect(page).to have_content("Litfit")
      expect(page).to have_content("Material: Lamp Shade")
      expect(page).to have_content("Challenge Theme: Apartment Furnishings")
    end
  end
  
  
end 