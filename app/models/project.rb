class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def avg_exp 
    (contestants.sum { |contestant| contestant.years_of_experience }.to_f / contestants.count).round(1)
  end
end
