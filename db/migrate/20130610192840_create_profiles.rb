class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.date :birthday
      t.string :gender
      t.string :location
      t.integer :user_id
    end
    add_index :profiles, :user_id
  end
end
