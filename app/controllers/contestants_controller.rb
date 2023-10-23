class ContestantsController < ActionController::Base
  def index
    # require 'pry'; binding.pry
    @contestants = Contestant.all
  end
end