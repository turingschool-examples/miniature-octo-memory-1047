require 'rails_helper'

RSpec.describe "projects show page" do
  before :each do
    @recycled_material_challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)
    @boardfit = @recycled_material_challenge.projects.create!(name: "Boardfit", material: "Cardboard Boxes")
  end

  it "shows the project's name, material, and challenge theme" do
    visit "/projects/#{@boardfit.id}"

    expect(page).to have_content("Project Name")
    expect(page).to have_content("Material")
    expect(page).to have_content("Challenge Theme")
    expect(page).to have_content(@recycled_material_challenge.theme)
    expect(page).to have_content(@boardfit.name)
    expect(page).to have_content(@boardfit.material)
  end
end