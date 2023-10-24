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

  describe 'challenge_theme' do
    it 'shows project challenge theme' do
      @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
            
      expect(@boardfit.challenge_theme).to eq("Recycled Material")
    end
  end
end
