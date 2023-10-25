class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def self.avg_exp(project)
    project.contestants.average(:years_of_experience)
  end

  def add_contestant(cont_id)
    new_contestant = Contestant.find(cont_id)
    # require 'pry'; binding.pry
    unless self.contestants.include?(new_contestant)
      self.contestants << new_contestant
    end
  end
end
