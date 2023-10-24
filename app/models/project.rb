class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def challenge_theme
    challenge.theme
  end

  def number_of_contestants
    contestants.count
  end

  def average_years_of_experience
    average_years = contestants.average(:years_of_experience)
  end
end
