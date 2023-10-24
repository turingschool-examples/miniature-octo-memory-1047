RSpec.describe "projects#show page" do 
  it "displays a project's name and material" do

    challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    project = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

    visit "/projets/#{project.id}"
    expect(page).to have_content("News Chic")
    expect(page).to have_content("Recycled Material")

  end



    it "shows a list of projects each contestant is working on" do

      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)

      visit "/contestants"

      expect(page).to have_content("Jay McCarroll")
      expect(page).to have_content("Projects: News Chic")
      expect(page).to have_content( "Gretchen Jones")
      expect(page).to have_content( "Projects: News Chic, Upholstery Tuxedo")
    end


  end
end 