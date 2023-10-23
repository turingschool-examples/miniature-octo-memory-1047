require "rails_helper"

RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    
    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")    

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    @jay.projects << @boardfit
    @jay.projects << @upholstery_tux
    @erin.projects << @news_chic
    @erin.projects << @upholstery_tux
  end

  describe "instance methods" do
    describe "#contestant_count" do
      it "returns a count of contestants on a given project" do
        expect(@upholstery_tux.contestant_count).to eq(2)
        expect(@boardfit.contestant_count).to eq(1)
        expect(@lit_fit.contestant_count).to eq(0)
      end
    end

    describe "#contestant_exp" do
      it "returns the average years of experience for project contestants" do
        expect(@upholstery_tux.contestant_exp).to eq(14)
        expect(@boardfit.contestant_exp).to eq(13)
        expect(@news_chic.contestant_exp).to eq(15)
      end
    end
  end
end
