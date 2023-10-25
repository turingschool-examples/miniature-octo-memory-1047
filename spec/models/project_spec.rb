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

  describe "#project_challenge_theme" do 
    it "lists the theme of the challenge a project belongs too" do 
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      expect(news_chic.project_challenge_theme).to eq("Recycled Material")
    end
  end

  describe "#count_contestants" do 
    it "will count all contestants assigned to a project" do 
       recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)

      expect(news_chic.count_contestants).to eq(1)
    end
  end

  describe "#contestant_avg_exp" do 
    it "will return the average years of experience for the contestants on a project" do 
       recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)

      expect(news_chic.contestant_avg_exp).to eq(12.5)
    end
    it "will not calculate the average if there are no contestants" do 
       recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    

      expect(news_chic.contestant_avg_exp).to eq(0)
    end
  end
end
