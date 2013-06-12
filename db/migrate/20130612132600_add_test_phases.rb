class AddTestPhases < ActiveRecord::Migration
  def change
    create_table :test_phases do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :project_id
    end
    add_index :test_phases, :project_id
  end
end
