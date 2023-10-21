class Contestant < ApplicationRecord
  has_many :contestant_projects
  has_many :projects, through: :contestant_projects
  validates_presence_of :name, :age, :hometown, :years_of_experience

  def projects_names
    self.projects.pluck(:name).to_sentence(two_words_connector: ', ')
  end
end
