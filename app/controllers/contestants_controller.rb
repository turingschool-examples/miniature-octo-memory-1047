class ContestantsController < ApplicationController
  def index
    @contestants = Contestant.all
    # @contestants = Contestant.projects
    # require 'pry'; binding.pry
  end
end