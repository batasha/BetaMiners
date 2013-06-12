class AddFeedbackSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :test_phase_id
    end
    add_index :surveys, :test_phase_id
  end
end
