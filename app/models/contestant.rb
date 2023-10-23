class Contestant < ApplicationRecord
  validates_presence_of :name, :age, :hometown, :years_of_experience

  def self.projects
    require 'pry'; binding.pry
  end
end
