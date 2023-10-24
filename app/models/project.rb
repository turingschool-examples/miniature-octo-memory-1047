class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def experience
    total = 0
    count = 0
    self.contestants.each do |c|
      count += 1
      total += c.years_of_experience
    end
    total/count.to_f
  end
end
