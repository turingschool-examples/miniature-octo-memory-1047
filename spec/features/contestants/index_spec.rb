require "rails_helper"

RSpec.describe  "contestants#index page" do

  it "shows a list of names of all the contestants" do 
    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    expect(page).to have_content("Jay McCarroll")
    expect(page).to have_content("Gretchen Jones")
    expect(page).to have_content("Kentaro Kameyama")
    expect(page).to have_content("Erin Robertson")
  end
end