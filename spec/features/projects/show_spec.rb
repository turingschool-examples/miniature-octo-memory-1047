require 'rails_helper'


RSpec.describe '/projects/:id' do
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
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
    ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)
    ContestantProject.create(contestant_id: @jay.id, project_id: @boardfit.id)
  end

  describe 'as a visitor' do
    describe 'when I visit /projects/:id' do
      it 'shows projects name material and challenge theme' do
        #US 1
        # As a visitor,
        # When I visit a project's show page ("/projects/:id"),
        visit "/projects/#{@news_chic.id}"

        # I see that project's name and material
        expect(page).to have_content(@news_chic.name)
        expect(page).to have_content(@news_chic.material)
        # And I also see the theme of the challenge that this project belongs to.
        expect(page).to have_content(@recycled_material_challenge.theme)
        # (e.g.    Litfit
        # Material: Lamp Shade
        # Challenge Theme: Apartment Furnishings)
      end

      it 'shows number of contestants for projects' do
        #US 3
        # As a visitor,
        # When I visit a project's show page
        # I see a count of the number of contestants on this project

        # (e.g.    Litfit
        # Material: Lamp Shade
        # Challenge Theme: Apartment Furnishings
        # Number of Contestants: 3 )

        visit "/projects/#{@news_chic.id}"
        expect(page).to have_content("Number of Contestants: 1")
        
        visit "/projects/#{@upholstery_tux.id}"
        expect(page).to have_content("Number of Contestants: 2")
        
        visit "/projects/#{@boardfit.id}"
        expect(page).to have_content("Number of Contestants: 3")
      end

      it 'shows average experience of contestants worked on that project' do
        #extension 1
        # As a visitor,
        # When I visit a project's show page
        # I see the average years of experience for the contestants that worked on that project
        # (e.g.    Litfit
        # Material: Lamp Shade
        # Challenge Theme: Apartment Furnishings
        # Number of Contestants: 3
        # Average Contestant Experience: 10.25 years)

        visit "/projects/#{@news_chic.id}"
        expect(page).to have_content("Average Contestant Experience: 13")
        
        visit "/projects/#{@upholstery_tux.id}"
        expect(page).to have_content("Average Contestant Experience: 10")
        
        visit "/projects/#{@boardfit.id}"
        expect(page).to have_content("Average Contestant Experience: 12")
      end

      # xit 'allows you to add a contestant' do
      #   #extension 2
      #   # As a visitor,
      #   # When I visit a project's show page
      #   # I see a form to add a contestant to this project
      #   # When I fill out a field with an existing contestants id
      #   # And hit "Add Contestant To Project"
      #   # I'm taken back to the project's show page
      #   # And I see that the number of contestants has increased by 1
      #   # And when I visit the contestants index page
      #   # I see that project listed under that contestant's name

      #   visit "/projects/#{@news_chic.id}"
      #   expect(page).to have_content("Number of Contestants: 1")
      #   expect(page).to_not have_content(@gretchen.name)
        
      #   fill_in("Contestant ID", with: @gretchen.id)
      #   click_button("Add Contestant To Project")
        
      #   expect(current_path).to eq("/projects/#{@news_chic.id}")
      #   expect(page).to have_content("Number of Contestants: 2")
      #   expect(page).to have_content(@gretchen.name)
      # end
    end
  end
end