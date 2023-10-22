require "rails_helper"

RSpec.describe Project, type: :feature do
  describe "When I visit a project's show page" do
    it "I see that project's name and material And I also see the theme of the challenge that this project belongs to" do
      @project_1 = Project.new(id: 1, name: "bottles", material: "plastic")
      @challenge_1 = Challenge.new(theme: "recycle", project_budget: 500)
      
      visit "/projects/#{@project_1.id}"

      expect(page).to have_content(@project_1.name)
      expect(page).to have_content(@project_1.material)
      expect(page).to have_content(@challenge_1.theme)
      expect(page).to have_content(@count)
    end
  end
end

