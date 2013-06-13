class AddRequests < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :user_id
      t.integer :project_id
    end
    add_index :registrations, :user_id
    add_index :registrations, :project_id
  end
end
