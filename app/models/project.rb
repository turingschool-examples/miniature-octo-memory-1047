class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def contestant_count
    ContestantProject.where("project_id = #{self.id}").count
  end

  def contestant_exp
    contestants_projects = ContestantProject.where("project_id = #{self.id}")
    contestants = contestants_projects.flat_map do |contestant_project|
      Contestant.where("id = #{contestant_project.contestant_id}")
    end

    exp = 0
    contestants.each do |contestant|
      exp += contestant.years_of_experience
    end
    average_exp = exp/self.contestant_count
  end

  def add_contestant(contestant_id)
    contestant = Contestant.find(contestant_id)
    self.contestants << contestant
  end
end
