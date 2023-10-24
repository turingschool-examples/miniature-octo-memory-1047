require 'rails_helper'

RSpec.describe "Project Show Page" do
  before(:each) do
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    @litfit = @furniture_challenge.projects.create!(name: "Litfit", material: "Lamp Shade")
  end

  it 'when visiting project show page, user can see project name, material, and name of theme' do
    visit "/projects/#{@litfit.id}"
    expect(page).to have_content(@litfit.name)
    expect(page).to have_content(@litfit.material)
    expect(page).to have_content(@litfit.challenge.theme)
  end

end