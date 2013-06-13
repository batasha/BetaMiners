class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :question_id
      t.string :text
    end
    add_index :responses, :question_id
  end
end
