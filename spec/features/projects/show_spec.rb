require "rails_helper"

RSpec.describe "project show" do
  before :each do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
    ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)

    visit "/projects/#{@news_chic.id}"
  end

  describe "US 1 - visit a projects show page" do
    it "I see the project's name, material and also the theme of the challenge this project belongs to" do
      expect(page).to have_content("Name: #{@news_chic.name}")
      expect(page).to have_content("Material: #{@news_chic.material}")
      expect(page).to have_content("Challenge Theme: #{@recycled_material_challenge.theme}")
    end
  end

  describe "US 3 - visit a projects show page" do
    it "I see a count of number of contestants on this project" do
      expect(page).to have_content("Number of Contestants: 3")
    end
  end

  describe "US 4 - projects show page" do
    it "I see the average years of experience for contestants that worked on that project" do
      save_and_open_page
      expect(page).to have_content("Average Contestant Experience:")
    end
  end
end
