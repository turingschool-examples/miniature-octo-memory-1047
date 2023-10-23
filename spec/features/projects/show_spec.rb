require "rails_helper"

RSpec.describe "Projects" do
  before :each do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
  end

  it "When I visit the show page for a project I see the name, material, and chellenge theme" do
    visit "/projects/4"

    expect(page).to have_content("Litfit")
    expect(page).to have_content(@lit_fit.material)
    expect(page).to have_content(@furniture_challenge.theme)
  end
end