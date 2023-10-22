require "rails_helper"

RSpec.describe Project, type: :feature do
  describe "When I visit the contestants index page" do
    it "I see a list of names of all the contestants And under each contestants name I see a list of the projects" do
      @contestant = Contestant.new(name: "Jimmy", age: 23, hometown: "Phoenix", years_of_experience: 3)

      visit "/contestants"

      expect(page).to have_content(@contestant.name)
    end
  end
end