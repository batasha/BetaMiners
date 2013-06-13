class AddFeedback < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :survey_id
      t.integer :user_id
    end

    create_table :choices do |t|
      t.integer :feedback_id
      t.integer :response_id
    end

    add_index :feedbacks, :survey_id
    add_index :feedbacks, :user_id
    add_index :choices, :feedback_id
    add_index :choices, :response_id
  end
end
