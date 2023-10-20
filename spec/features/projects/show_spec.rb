require "rails_helper"

RSpec.describe "projects show page" do
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

  it "shows project attributes" do
    # As a visitor,
    # When I visit a project's show page ("/projects/:id"),
    # I see that project's name and material
    # And I also see the theme of the challenge that this project belongs to.
    # (e.g.    Litfit
    #     Material: Lamp Shade
    #   Challenge Theme: Apartment Furnishings)
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content @news_chic.name
    expect(page).to have_content @news_chic.material
    expect(page).to have_content @recycled_material_challenge.theme
  end

  it "shows the number of contestants on project" do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content "Number of Contestants: #{@news_chic.contestants.count}"
  end

  it "shows the avg years of exp. for contestants by project" do
    # As a visitor,
    # When I visit a project's show page
    # I see the average years of experience for the contestants that worked on that project
    # (e.g.    Litfit
    #     Material: Lamp Shade
    #   Challenge Theme: Apartment Furnishings
    #   Number of Contestants: 3
    #   Average Contestant Experience: 10.25 years)
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content "Average Contestant Experience: 12.5 years"
  end

  describe "adds contestant to project" do
    # As a visitor,
    # When I visit a project's show page
    # I see a form to add a contestant to this project
    # When I fill out a field with an existing contestants id
    # And hit "Add Contestant To Project"
    # I'm taken back to the project's show page
    # And I see that the number of contestants has increased by 1
    # And when I visit the contestants index page
    # I see that project listed under that contestant's name
    it "shows form to add contestant" do
      visit "/projects/#{@news_chic.id}"
      
      expect(page).to have_field :name
    end

    it "redirects to projects show page, data increased, and reflected on contestants index" do
      visit "/projects/#{@news_chic.id}"

      fill_in "Name", with: "Sir TP"
      fill_in "Years of Exp:", with: 3
      fill_in "Age", with: 33
      fill_in "Hometown", with: "PHX"
      click_button "Add Contestant"

      expect(page).to have_current_path "/projects/#{@news_chic.id}"

      expect(page).to have_content "Number of Contestants: 3"

      visit "/contestants"

      expect(page).to have_content "TP"
    end
  end
end