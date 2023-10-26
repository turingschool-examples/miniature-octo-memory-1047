require 'rails_helper'

RSpec.describe 'Projects show page' do
  
  describe "When I visit a project's show page" do
    it 'displays project name and material and theme of challenge for this project' do
      challenge = Challenge.create(theme: 'Volcano' project_budget: 500)
      project = challenge.projects.create(name: 'Volcano Project' material: 'Clay')

      visit "/projects/#{project.id}"

      expect(page).to have_content(project.name)
      expect(page).to have_content("Material: #{project.material}")
      expect(page).to have_content("Challenge Theme: #{challenge.theme}")
    end
  end

  
end