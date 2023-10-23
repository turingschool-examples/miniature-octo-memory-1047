require "rails_helper"

RSpec.describe "the project show" do

  before :each do
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
    ContestantProject.create(contestant_id: @jay.id, project_id: @lit_fit.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
    ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)
    ContestantProject.create(contestant_id: @erin.id, project_id: @news_chic.id)
  end

#   User Story 1 of 3

# As a visitor,
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)

  describe "As a visitor, when I visit a project's show page ('/projects/:id')" do
    it "I see that projects name and material, and I also see the theme of the challenge this project belongs to" do
      visit "/projects/#{@news_chic.id}"
      expect(page).to have_content("News Chic")
      expect(page).to have_content("Material: Newspaper")
      expect(page).to have_content("Challenge Theme: Recycled Material")
      visit "/projects/#{@lit_fit.id}"
      expect(page).to have_content("Litfit")
      expect(page).to have_content("Material: Lamp")
      expect(page).to have_content("Challenge Theme: Apartment Furnishings")
    end

#     User Story 3 of 3
# As a visitor,
# When I visit a project's show page
# I see a count of the number of contestants on this project

# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings
#   Number of Contestants: 3 )

    it "I see a count of the number of contestants on this project" do
      visit "/projects/#{@news_chic.id}"
      expect(page).to have_content("Number of Contestants: 3")

      visit "/projects/#{@boardfit.id}"
      expect(page).to have_content("Number of Contestants: 2")
      
      visit "/projects/#{@upholstery_tux.id}"
      expect(page).to have_content("Number of Contestants: 2")
      
      visit "/projects/#{@lit_fit.id}"
      expect(page).to have_content("Number of Contestants: 1")

    end

    # User Story Extension 1 - Average years of experience for contestants by project

# As a visitor,
# When I visit a project's show page
# I see the average years of experience for the contestants that worked on that project
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings
#   Number of Contestants: 3
#   Average Contestant Experience: 10.25 years)

    it "I see the average years of experience for the contestants that worked on that project" do
      
      visit "/projects/#{@news_chic.id}"
      expect(page).to have_content("Average Contestant Experience: 13.3 years")

      visit "/projects/#{@boardfit.id}"
      expect(page).to have_content("Average Contestant Experience: 11.5 years")
      
      visit "/projects/#{@upholstery_tux.id}"
      expect(page).to have_content("Average Contestant Experience: 10.0 years")
      
      visit "/projects/#{@lit_fit.id}"
      expect(page).to have_content("Average Contestant Experience: 13.0 years")

    end

#     User Story Extension 2 - Adding a contestant to a project

# As a visitor,
# When I visit a project's show page
# I see a form to add a contestant to this project
# When I fill out a field with an existing contestants id
# And hit "Add Contestant To Project"
# I'm taken back to the project's show page
# And I see that the number of contestants has increased by 1
# And when I visit the contestants index page
# I see that project listed under that contestant's name

    describe "I see a form to add a contestant to this project. I can enter the contestant id" do
      it "I hit 'Add Contestant To Project' and I'm taken back to the project's show page where that change is reflected" do
        visit "/projects/#{@lit_fit.id}"
        expect(page).to have_content("Number of Contestants: 1")
        expect(page).to have_content("Enter Contestant ID")
        fill_in(:contestant_id, with: "#{@erin.id}")
        click_button("Add Contestant To Project")
        expect(current_path).to eq("/projects/#{@lit_fit.id}")
        expect(page).to have_content("Number of Contestants: 2")

      end

      it "When I visit the contestant index page, this change is also reflected" do
        visit "/projects/#{@lit_fit.id}"
        fill_in(:contestant_id, with: "#{@erin.id}")
        click_button("Add Contestant To Project")
        visit "/contestants"
        expect(page).to have_content("Projects: Litfit , News Chic , Boardfit")
      end
    end
  end
end