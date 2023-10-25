class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def project_challenge_theme
    challenge.theme
  end

  def count_contestants
    contestants.count
  end
  
  def contestant_avg_exp
    total_exp = contestants.pluck(:years_of_experience).sum.to_f
    if total_exp > 0
      avg_exp = total_exp / count_contestants
    else
      total_exp
    end
  end
end
