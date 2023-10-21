class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge

  def challenge_theme
    challenge.theme
  end
end
