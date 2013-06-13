class AddUserAgentToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :os, :string
    add_column :feedbacks, :browser, :string
    add_column :feedbacks, :version, :string
  end
end
