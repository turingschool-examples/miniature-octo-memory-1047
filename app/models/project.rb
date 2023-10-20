class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def avg_yoe_of_contestants
    contestants.calculate(:average, :years_of_experience)
  end
end
