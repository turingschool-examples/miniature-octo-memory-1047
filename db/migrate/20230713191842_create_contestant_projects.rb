class CreateContestantProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :contestant_projects do |t|
      t.references :contestant, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
