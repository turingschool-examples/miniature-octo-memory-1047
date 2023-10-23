class Project < ApplicationRecord
  validates_presence_of :name, :material

  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def contestant_count
    self.contestants.count
  end

  def contestant_experience_avg
    if self.contestant_count == 0
      0
    else
      self.contestants.average(:years_of_experience)
    end
  end
end
