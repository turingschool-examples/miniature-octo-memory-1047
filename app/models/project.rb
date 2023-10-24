class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge

  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def challenge_theme
    self.challenge.theme
  end

  def con_count
    self.contestants.count
  end

  def average_exp
    self.contestants.average(:years_of_experience).round
  end
end
