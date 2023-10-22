class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def challenge_theme
    challenge.theme
  end

  def contestants_count
    self.contestants.length
  end

  def avg_years_experience
    self.contestants.average(:years_of_experience)
  end
end
