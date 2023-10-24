class ContestantProject < ApplicationRecord
  belongs_to :project
  belongs_to :contestant

  def self.match(int)
    contestants = []
    project = self.all
    project.each do |cp|
      if cp.project_id == int
        contestants << cp
      end
    end
    contestants.count
  end

end
