class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :url
      t.string :category
      t.text :description
      t.boolean :private
      t.integer :user_id
    end
    add_index :projects, :user_id
  end
end
