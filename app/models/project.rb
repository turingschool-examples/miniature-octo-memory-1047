class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def average_years_experience
    self.contestants.average(:age).to_f.round(2)
  end
end
