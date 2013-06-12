class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :survey_id
      t.string :text
    end
    add_index :questions, :survey_id
  end
end
