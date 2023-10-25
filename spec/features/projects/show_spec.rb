require "rails_helper"

RSpec.describe Project, type: :feature do
  before (:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    
    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    @cp_1 = ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    @cp_2 = ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    @cp_5 = ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
    @cp_6 = ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)

  end

  it 'shows the project name, material, and theme' do
    visit "/projects/#{@news_chic.id}"
    expect(page).to have_content("News Chic")
    expect(page).to have_content("Newspaper")
    expect(page).to have_content("Recycled Material")
  end
  
  it 'second test for name, material, and theme' do
    
    visit "/projects/#{@boardfit.id}"
    expect(page).to have_content("Boardfit")
    expect(page).to have_content("Cardboard Boxes")
    expect(page).to have_content("Recycled Material")
  end

  it 'counts the number of contestants per project' do
    visit "/projects/#{@boardfit.id}"
    expect(page).to have_content("Number of Contestants: 2")
  end
  it 'counts the number of contestants per project' do
    visit "/projects/#{@news_chic.id}"
    expect(page).to have_content("Number of Contestants: 2")
  end

#   As a visitor,
# When I visit a project's show page
# I see a count of the number of contestants on this project
end