require 'rails_helper'

RSpec.describe "projects show page" do
  before :each do
    @recycled_material_challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)
    @boardfit = @recycled_material_challenge.projects.create!(name: "Boardfit", material: "Cardboard Boxes")
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
  end

  it "shows the project's name, material, and challenge theme" do
    visit "/projects/#{@boardfit.id}"

    expect(page).to have_content("Project Name")
    expect(page).to have_content("Material")
    expect(page).to have_content("Challenge Theme")
    expect(page).to have_content(@boardfit.name)
    expect(page).to have_content(@boardfit.material)
    expect(page).to have_content(@recycled_material_challenge.theme)
  end

  it "shows the number of contestants on the project" do
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    ContestantProject.create(contestant_id: @gretchen.id, project_id: upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: upholstery_tux.id)

    visit "/projects/#{upholstery_tux.id}"

    expect(page).to have_content("Number of Contestants:")
    expect(page).to have_content("2")
  end
end