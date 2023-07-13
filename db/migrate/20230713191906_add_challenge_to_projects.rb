class AddChallengeToProjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :challenge, null:false, foreign_key: true
  end
end
