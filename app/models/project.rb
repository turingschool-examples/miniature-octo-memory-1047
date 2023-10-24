class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def challenge_theme
    challenge.theme
  end

  def num_contestants
    contestants.count
  end

  def ave_exp
    contestants.average(:years_of_experience).to_i
  end
end
