class AddCommentsToChoices < ActiveRecord::Migration
  def change
    add_column :choices, :comment, :text
    remove_column :feedbacks, :comments
  end
end
